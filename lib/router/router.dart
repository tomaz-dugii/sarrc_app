import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarrc_app/router/router.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/", page: AppHomeRoute.page, initial: true),
        AutoRoute(path: "/event", page: EventRoute.page, children: [
          RedirectRoute(path: '', redirectTo: 'home'),
          AutoRoute(
            path: "home",
            page: EventHomeTab.page,
            children: [
              AutoRoute(path: '', page: EventHomeRoute.page),
              AutoRoute(
                path: 'details',
                page: AthletesDetailsRoute.page,
              ),
              RedirectRoute(path: '*', redirectTo: ''),
            ],
          ),
          AutoRoute(path: "athletes", page: EventAthleteTab.page, children: [
            AutoRoute(path: '', page: EventAthletesRoute.page),
            AutoRoute(
              path: 'details',
              page: AthletesDetailsRoute.page,
            ),
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
          AutoRoute(path: "menu", page: EventMenuTab.page, children: [
            AutoRoute(path: '', page: EventMenuRoute.page),
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
        ]),
      ];
}

@RoutePage(name: 'EventHomeTab')
class EventHomeTabPage extends AutoRouter {
  const EventHomeTabPage({super.key});
}

@RoutePage(name: 'EventAthleteTab')
class EventAthleteTabPage extends AutoRouter {
  const EventAthleteTabPage({super.key});
}

@RoutePage(name: 'EventMenuTab')
class EventMenuTabPage extends AutoRouter {
  const EventMenuTabPage({super.key});
}
