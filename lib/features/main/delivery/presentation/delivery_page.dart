import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_primary_button.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_secondary_textfield.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_small_button.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/drop_off_request.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/pickup_request.dart';
import 'package:gimme_delivery/features/main/delivery/presentation/cubit/delivery_cubit.dart';
import 'package:gimme_delivery/features/main/delivery/presentation/widget/merchant_list_item.dart';
import 'package:gimme_delivery/router/app_router.dart';
import 'package:gimme_delivery/router/app_router.gr.dart';
import 'package:location/location.dart';

@RoutePage()
class DeliveryPage extends StatefulWidget {
  const DeliveryPage({required this.currLocation, super.key});

  static const String routeName = "/delivery";

  final LocationData currLocation;

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  late final DeliveryCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<DeliveryCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit
        ..setPickUpRequest(
          PickUpRequest(
            senderName: '',
            senderPhone: '',
            locationName: '',
            address: '',
            longitude: widget.currLocation.longitude!,
            latitude: widget.currLocation.latitude!,
          ),
        )
        ..getMerchants(),
      child: Scaffold(
        body: BlocBuilder<DeliveryCubit, DeliveryState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => getIt<AppRouter>().pop(),
                              icon: const Icon(
                                Icons.close,
                              ),
                            ),
                            Text(
                              'Where do you want to deliver?',
                              style: AppTextStyle.headlineMedium()
                                  .copyWith(height: 0),
                            )
                          ],
                        ),
                        Gap(10.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          decoration: BoxDecoration(
                              color: AppColors.surfaceColor,
                              borderRadius: BorderRadius.circular(20.sp),
                              border: Border.all(
                                  color: AppColors.hintTextColor
                                      .withOpacity(0.2))),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_up_rounded,
                                    color: AppColors.green,
                                    size: 35.sp,
                                  ),
                                  Gap(14.h),
                                  Icon(
                                    Icons.share_location_rounded,
                                    color: AppColors.primaryColor,
                                    size: 35.sp,
                                  ),
                                ],
                              ),
                              Gap(12.w),
                              Expanded(
                                child: Column(
                                  children: [
                                    AppSecondaryTextField(
                                        controller: _cubit.pickPointController,
                                        onTap: () async {
                                          await getIt<AppRouter>()
                                              .push(
                                            PickUpRoute(
                                              merchants: state.merchants ?? [],
                                              pickUpRequest:
                                                  state.pickUpRequest!,
                                            ),
                                          )
                                              .then(
                                            (value) {
                                              if (value is PickUpRequest) {
                                                _cubit.setPickUpRequest(value);
                                              }
                                            },
                                          );
                                        },
                                        isReadOnly: true,
                                        hint: "Search for pick point"),
                                    Divider(
                                      height: 1,
                                      color: AppColors.hintTextColor
                                          .withOpacity(0.2),
                                    ),
                                    AppSecondaryTextField(
                                        controller: _cubit.dropOffController,
                                        onTap: () async {
                                          await getIt<AppRouter>()
                                              .push(
                                            DropOffRoute(
                                              merchants: state.merchants ?? [],
                                              dropOffRequest:
                                                  state.dropOffRequest ??
                                                      DropOffRequest(
                                                        receiverName: '',
                                                        receiverPhone: '',
                                                        locationName: '-',
                                                        address: '-',
                                                        longitude: state
                                                            .pickUpRequest!
                                                            .longitude,
                                                        latitude: state
                                                            .pickUpRequest!
                                                            .latitude,
                                                      ),
                                            ),
                                          )
                                              .then(
                                            (value) {
                                              if (value is DropOffRequest) {
                                                _cubit.setDropOffRequest(value);
                                              }
                                            },
                                          );
                                        },
                                        isReadOnly: true,
                                        hint: "Search for destination point"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Gap(20.h),
                        AppSmallButton(
                          label: 'Select via map',
                          icon: Icons.map_rounded,
                          onTap: () async {
                            await getIt<AppRouter>()
                                .push(
                              PickUpRoute(
                                merchants: state.merchants ?? [],
                                pickUpRequest: state.pickUpRequest!,
                              ),
                            )
                                .then(
                              (value) {
                                if (value is PickUpRequest) {
                                  _cubit.setPickUpRequest(value);
                                }
                              },
                            );
                          },
                        ),
                        Divider(
                          height: 40.h,
                          color: AppColors.hintTextColor.withOpacity(0.2),
                        ),
                        Text(
                          'Nearby',
                          style: AppTextStyle.headlineMedium(),
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.merchants?.length ?? 0,
                      itemBuilder: (context, index) {
                        var merchant = state.merchants![index]!;
                        return MerchantListItem(
                          merchant: merchant,
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                  if (state.pickUpRequest != null &&
                      state.dropOffRequest != null)
                    Column(
                      children: [
                        Gap(20.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          width: double.infinity,
                          child: AppPrimaryButton(
                            onPressed: () {
                              getIt<AppRouter>().push(
                                DeliveryCheckoutRoute(cubit: _cubit),
                              );
                            },
                            text: 'Next',
                          ),
                        ),
                        Gap(20.h),
                      ],
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
