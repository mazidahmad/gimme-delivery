import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/theme/app_colors.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_logo_widget.dart';
import 'package:gimme_delivery/router/app_router.dart';
import 'package:gimme_delivery/router/app_router.gr.dart';

@RoutePage()
class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  static const String routeName = '/startup';

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => getIt<AppRouter>().replace(const OnBoardingRoute()));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Center(
          child: AppLogoWidget(),
        ),
      ),
    );
  }
}
