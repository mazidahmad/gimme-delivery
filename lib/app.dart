import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/theme/screen_size.dart';
import 'package:gimme_delivery/router/app_router.dart';

import 'core/theme/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    var windowData = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return ScreenUtilInit(
      designSize: Size(
        ScreenSize.width,
        ScreenSize.height,
      ),
      builder: (context, child) => MediaQuery(
        data: windowData.copyWith(textScaleFactor: 1),
        child: MaterialApp.router(
          title: 'Gimme Delivery',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.main(),
          themeMode: ThemeMode.dark,
          darkTheme: AppTheme.main(),
          routerConfig: _appRouter.config(),
          builder: EasyLoading.init(builder: FToastBuilder()),
        ),
      ),
    );
  }
}
