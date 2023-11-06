import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/config/env.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_primary_button.dart';
import 'package:gimme_delivery/router/app_router.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@RoutePage()
class PickUpPage extends StatefulWidget {
  const PickUpPage({
    super.key,
    required this.lattitude,
    required this.longitude,
  });

  static const String routeName = "/pick-up";

  final double lattitude;
  final double longitude;

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> {
  late final CameraOptions _initCameraOptions;
  MapboxMap? mapboxMap;
  Timer? timer;
  double _currLatitude = 0;
  double _currLongitude = 0;

  @override
  void initState() {
    _currLatitude = widget.lattitude;
    _currLongitude = widget.longitude;
    _initCameraOptions = CameraOptions(
        center: Point(
          coordinates: Position(widget.longitude, widget.lattitude),
        ).toJson(),
        zoom: 15.0);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void setCameraPosition(Position position) {
    mapboxMap?.flyTo(
        CameraOptions(
          center: Point(coordinates: position).toJson(),
          zoom: 15,
        ),
        null);
  }

  void _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;
    // var position = Position(_currLatitude, _currLongitude);

    // setCameraPosition(position);

    mapboxMap.location.updateSettings(
      LocationComponentSettings(
          locationPuck: LocationPuck(locationPuck2D: LocationPuck2D()),
          pulsingEnabled: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          width: double.infinity,
          child: AppPrimaryButton(
            text: 'Next',
            onPressed: () {},
          ),
        )
      ],
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MapWidget(
            cameraOptions: _initCameraOptions,
            onMapCreated: _onMapCreated,
            resourceOptions: ResourceOptions(accessToken: Env.mapBoxToken),
            onScrollListener: (coordinate) {
              _currLongitude = coordinate.y;
              _currLatitude = coordinate.x;
              setState(() {});
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.sp),
                ),
                child: IconButton(
                  onPressed: () => getIt<AppRouter>().pop(),
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
              ),
              Gap(10.h),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Double check suggested\npickup point',
                        style:
                            AppTextStyle.headlineMedium().copyWith(height: 1.5),
                      ),
                      Gap(20.h),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 18.h),
                          decoration: BoxDecoration(
                              color: AppColors.surfaceColor,
                              borderRadius: BorderRadius.circular(20.sp),
                              border: Border.all(
                                  color: AppColors.hintTextColor
                                      .withOpacity(0.2))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jln. Rasamala VI',
                                style: AppTextStyle.headlineMedium(),
                              ),
                              Gap(10.h),
                              Text(
                                'Description',
                                style: AppTextStyle.bodyMedium(
                                    color: AppColors.hintTextColor),
                              ),
                              Divider(
                                height: 20.h,
                                color: AppColors.hintTextColor.withOpacity(0.2),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Lon: $_currLongitude',
                                    style: AppTextStyle.bodySmall(
                                        color: AppColors.hintTextColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Lat: $_currLatitude',
                                    style: AppTextStyle.bodySmall(
                                        color: AppColors.hintTextColor),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppAssets.pickMarker,
                  width: 50.w,
                  height: 50.h,
                ),
                Gap(35.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
