import 'package:auto_route/auto_route.dart';
import 'package:to_do_app/core/router/routers.gr.dart';
// part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: LauncherScreen.page, initial: true, path: '/'),
        AutoRoute(
          page: LoginScreen.page,
          path: '/homeScreen',
        ),
        AutoRoute(
          page: HomeScreen.page,
          path: '/homeScreen',
        ),
      ];
}
