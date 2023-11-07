import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/config/env.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/utils/date_util.dart';
import 'package:gimme_delivery/core/utils/map_utils.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_search_form_field.dart';
import 'package:gimme_delivery/features/main/presentation/cubit/main_cubit.dart';
import 'package:gimme_delivery/features/main/presentation/widget/delivery_section.dart';
import 'package:gimme_delivery/router/app_router.dart';
import 'package:gimme_delivery/router/app_router.gr.dart';
import 'package:location/location.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../core/theme/theme.dart';
import 'widget/home_header.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late AppBar _appBar;
  late final MainCubit _cubit;
  LocationData? _locationData;
  MapboxMap? mapboxMap;
  final CameraOptions _initCameraOptions = CameraOptions(
      center: Point(
        coordinates: Position(-6.93576, 107.554051),
      ).toJson(),
      zoom: 12.0);

  @override
  void initState() {
    _appBar = AppBar();
    _cubit = getIt<MainCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  Future<void> initializeLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    try {
      _locationData = await location.getLocation();
    } catch (e) {
      print(e.toString());
    }

    setState(() {});
  }

  void _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;
    await initializeLocation();
    mapboxMap.gestures.updateSettings(
      GesturesSettings(
          scrollEnabled: false,
          rotateEnabled: false,
          pitchEnabled: false,
          pinchPanEnabled: false,
          doubleTapToZoomInEnabled: false,
          pinchToZoomEnabled: false),
    );
    mapboxMap.setCamera(
      CameraOptions(
          center: Point(
            coordinates: Position(
                _locationData!.longitude ?? 0, _locationData!.latitude ?? 0),
          ).toJson(),
          zoom: 12.0),
    );
    mapboxMap.location.updateSettings(
      LocationComponentSettings(
        locationPuck: LocationPuck(locationPuck2D: LocationPuck2D()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit
        ..getFullname()
        ..getDeliveries(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.surfaceColor,
            body: SafeArea(
              top: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      HomeHeader(
                        appbar: _appBar,
                        name: state.name,
                      ),
                      Column(
                        children: [
                          Gap(180.h),
                          Padding(
                            padding: EdgeInsets.all(24.sp),
                            child: Container(
                              padding: EdgeInsets.all(14.sp),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 130.h,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(12.sp),
                                      child: MapWidget(
                                        cameraOptions: _initCameraOptions,
                                        onMapCreated: _onMapCreated,
                                        resourceOptions: ResourceOptions(
                                            accessToken: Env.mapBoxToken),
                                      ),
                                    ),
                                  ),
                                  Gap(20.h),
                                  AppSearchFormField(
                                    isReadOnly: true,
                                    onTap: () => getIt<AppRouter>()
                                        .push(DeliveryRoute(
                                            currLocation: _locationData!))
                                        .then(
                                            (value) => _cubit.getDeliveries()),
                                    prefixIcon: const Icon(
                                      Icons.share_location_rounded,
                                      color: AppColors.primaryColor,
                                    ),
                                    hint: "Find for delivery point",
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'Your Deliveries',
                      style: AppTextStyle.headlineMedium(),
                    ),
                  ),
                  Gap(14.h),
                  Expanded(
                    child: (state.deliveries != null &&
                            state.deliveries!.isNotEmpty)
                        ? ListView.builder(
                            itemCount: state.deliveries?.length ?? 0,
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              var delivery = state.deliveries![index]!;
                              return Container(
                                color: AppColors.backgroundColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 18.h),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        DeliverySection(
                                          name:
                                              delivery.pickUpModel!.sender_name,
                                          locationName: delivery
                                              .pickUpModel!.location_name,
                                          address:
                                              delivery.pickUpModel!.address,
                                        ),
                                        Gap(5.w),
                                        const Icon(
                                          Icons.arrow_forward_rounded,
                                        ),
                                        Gap(5.w),
                                        DeliverySection(
                                          name: delivery
                                              .dropOffModel!.receiver_name,
                                          locationName: delivery
                                              .dropOffModel!.location_name,
                                          address:
                                              delivery.dropOffModel!.address,
                                          isReceiver: true,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                        color: AppColors.surfaceColor),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.timeline_outlined,
                                              color: AppColors.secondaryColor,
                                              size: 20.sp,
                                            ),
                                            Gap(5.w),
                                            Text(
                                              '${MapUtil.calculateDistance(delivery.distance)} Km',
                                              style: AppTextStyle.bodySmall()
                                                  .copyWith(height: 0),
                                            ),
                                          ],
                                        ),
                                        Gap(10.w),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.av_timer,
                                              color: AppColors.secondaryColor,
                                              size: 20.sp,
                                            ),
                                            Gap(5.w),
                                            Text(
                                              DateUtil.getSimpleDateTimeFormat(
                                                DateTime.parse(
                                                  delivery.est_delivery_time
                                                      .toString(),
                                                ),
                                              ),
                                              style: AppTextStyle.bodySmall()
                                                  .copyWith(height: 0),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              'No Deliveries Data',
                              style: AppTextStyle.bodyMedium(
                                  color: AppColors.hintTextColor),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
