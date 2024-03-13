import 'package:auto_route/auto_route.dart';

import 'routers.gr.dart';

@AutoRouterConfig()
class Routers extends $Routers {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}
