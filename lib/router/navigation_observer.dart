import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('-------- New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('-------- Did pop: ${route.settings.name} back to: ${previousRoute?.settings.name}');
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print('-------- Did replace: ${oldRoute?.settings.name} back to: ${newRoute?.settings.name}');
    super.didReplace();
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('-------- Did replace: ${route.settings.name} back to: ${previousRoute?.settings.name}');
    super.didRemove(route, previousRoute);
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('-------- Tab route visited: ${route.name} ${route.path}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('-------- Tab route re-visited: ${route.name} ${route.path}');
  }
}
