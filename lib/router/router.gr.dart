// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:sarrc_app/pages/app_home_page.dart' as _i1;
import 'package:sarrc_app/pages/event_pages/athletes_detail_page.dart' as _i2;
import 'package:sarrc_app/pages/event_athletes_page.dart' as _i4;
import 'package:sarrc_app/pages/event_home_page.dart' as _i5;
import 'package:sarrc_app/pages/event_menu_page.dart' as _i6;
import 'package:sarrc_app/pages/event_pages/event_page_navbar.dart' as _i7;
import 'package:sarrc_app/router/router.dart' as _i3;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AppHomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppHomePage(),
      );
    },
    AthletesDetailsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AthletesDetailsPage(),
      );
    },
    EventAthleteTab.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EventAthleteTabPage(),
      );
    },
    EventAthletesRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EventAthletesPage(),
      );
    },
    EventHomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.EventHomePage(),
      );
    },
    EventHomeTab.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EventHomeTabPage(),
      );
    },
    EventMenuRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EventMenuPage(),
      );
    },
    EventMenuTab.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EventMenuTabPage(),
      );
    },
    EventRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.EventPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppHomePage]
class AppHomeRoute extends _i8.PageRouteInfo<void> {
  const AppHomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AppHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppHomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AthletesDetailsPage]
class AthletesDetailsRoute extends _i8.PageRouteInfo<void> {
  const AthletesDetailsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AthletesDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AthletesDetailsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EventAthleteTabPage]
class EventAthleteTab extends _i8.PageRouteInfo<void> {
  const EventAthleteTab({List<_i8.PageRouteInfo>? children})
      : super(
          EventAthleteTab.name,
          initialChildren: children,
        );

  static const String name = 'EventAthleteTab';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EventAthletesPage]
class EventAthletesRoute extends _i8.PageRouteInfo<void> {
  const EventAthletesRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EventAthletesRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventAthletesRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EventHomePage]
class EventHomeRoute extends _i8.PageRouteInfo<void> {
  const EventHomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EventHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventHomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EventHomeTabPage]
class EventHomeTab extends _i8.PageRouteInfo<void> {
  const EventHomeTab({List<_i8.PageRouteInfo>? children})
      : super(
          EventHomeTab.name,
          initialChildren: children,
        );

  static const String name = 'EventHomeTab';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EventMenuPage]
class EventMenuRoute extends _i8.PageRouteInfo<void> {
  const EventMenuRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EventMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventMenuRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EventMenuTabPage]
class EventMenuTab extends _i8.PageRouteInfo<void> {
  const EventMenuTab({List<_i8.PageRouteInfo>? children})
      : super(
          EventMenuTab.name,
          initialChildren: children,
        );

  static const String name = 'EventMenuTab';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EventPage]
class EventRoute extends _i8.PageRouteInfo<void> {
  const EventRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EventRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
