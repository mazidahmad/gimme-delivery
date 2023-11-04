import 'package:auto_route/auto_route.dart';
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
        )
      ];
}
