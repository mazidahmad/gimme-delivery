import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/config/env.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/mixin/messenger_mixin.dart';
import 'package:gimme_delivery/core/theme/app_colors.dart';
import 'package:gimme_delivery/core/theme/app_text_style.dart';
import 'package:gimme_delivery/core/utils/map_utils.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_primary_button.dart';
import 'package:gimme_delivery/features/main/delivery/presentation/cubit/delivery_cubit.dart';
import 'package:gimme_delivery/features/main/delivery/presentation/widget/delivery_box.dart';
import 'package:gimme_delivery/router/app_router.dart';
import 'package:gimme_delivery/router/app_router.gr.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@RoutePage()
class DeliveryCheckoutPage extends StatefulWidget {
  const DeliveryCheckoutPage({required this.cubit, super.key});

  static const String routeName = '/checkout';

  final DeliveryCubit cubit;

  @override
  State<DeliveryCheckoutPage> createState() => _DeliveryCheckoutPageState();
}

class _DeliveryCheckoutPageState extends State<DeliveryCheckoutPage>
    with TickerProviderStateMixin, MessagerMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      bloc: widget.cubit,
      listener: (context, state) {
        if (state.status == DeliveryStateStatus.loading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();

          if (state.status == DeliveryStateStatus.mapCreated) {
            widget.cubit
                .drawRouteLowLevel(state.deliveryData!.coordinates, this);
          }
          if (state.status == DeliveryStateStatus.failed) {
            showAppToast(
                message: state.failure!.message, type: ToastType.error);
          }
          if (state.status == DeliveryStateStatus.requested) {
            showAppToast(
                message: 'Delivery Requested', type: ToastType.success);
            getIt<AppRouter>().popUntilRouteWithName(MainRoute.name);
          }
        }
      },
      builder: (context, state) => Scaffold(
        persistentFooterButtons: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            width: double.infinity,
            child: AppPrimaryButton(
              text: 'Request for Delivery',
              onPressed: () => widget.cubit.submitDeliveryRequest(),
            ),
          )
        ],
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  MapWidget(
                    cameraOptions: CameraOptions(
                        center: Point(
                          coordinates: Position(state.pickUpRequest!.longitude,
                              state.pickUpRequest!.latitude),
                        ).toJson(),
                        zoom: 15.0),
                    onMapCreated: widget.cubit.onMapCreated,
                    resourceOptions:
                        ResourceOptions(accessToken: Env.mapBoxToken),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    child: IconButton(
                      onPressed: () => getIt<AppRouter>().pop(),
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Double check delivery request details',
                          style: AppTextStyle.headlineMedium()
                              .copyWith(height: 1.5),
                        ),
                        Divider(
                            color: AppColors.hintTextColor.withOpacity(0.2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.timeline_outlined,
                                  color: AppColors.secondaryColor,
                                ),
                                Gap(5.w),
                                Text(
                                  '${MapUtil.calculateDistance(state.deliveryData?.distance)} Km',
                                  style: AppTextStyle.headlineMedium()
                                      .copyWith(height: 0),
                                ),
                              ],
                            ),
                            Gap(20.w),
                            Row(
                              children: [
                                const Icon(
                                  Icons.av_timer,
                                  color: AppColors.secondaryColor,
                                ),
                                Gap(5.w),
                                Text(
                                  '${MapUtil.calculateDuration(state.deliveryData?.duration)} min',
                                  style: AppTextStyle.headlineMedium()
                                      .copyWith(height: 0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                            color: AppColors.hintTextColor.withOpacity(0.2)),
                        Gap(10.h),
                        DeliveryBox(
                          icon: Icons.arrow_circle_up_rounded,
                          iconColor: AppColors.green,
                          name: state.pickUpRequest!.senderName,
                          phone: state.pickUpRequest!.senderPhone,
                          locationName: state.pickUpRequest!.locationName,
                          address: state.pickUpRequest!.address,
                        ),
                        Gap(20.h),
                        DeliveryBox(
                          icon: Icons.share_location_rounded,
                          iconColor: AppColors.primaryColor,
                          name: state.dropOffRequest!.receiverName,
                          phone: state.dropOffRequest!.receiverPhone,
                          locationName: state.dropOffRequest!.locationName,
                          address: state.dropOffRequest!.address,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
