import 'package:auto_route/auto_route.dart';
import 'package:gimme_delivery/features/authentication/presentation/authentication_page.dart';
import 'package:gimme_delivery/features/authentication/presentation/verification_page.dart';
import 'package:gimme_delivery/features/onboarding/presentation/onboarding_page.dart';
import 'package:gimme_delivery/features/startup/presentation/startup_page.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: StartupRoute.page,
          path: StartupPage.routeName,
        ),
        AutoRoute(
          page: OnBoardingRoute.page,
          path: OnBoardingPage.routeName,
        ),
        AutoRoute(
          page: AuthenticationRoute.page,
          path: AuthenticationPage.routeName,
        ),
        AutoRoute(
          page: VerificationRoute.page,
          path: VerificationPage.routeName,
        )
      ];
}
