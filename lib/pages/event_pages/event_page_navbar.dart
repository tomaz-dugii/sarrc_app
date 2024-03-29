import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarrc_app/router/router.gr.dart';

@RoutePage()
class EventPage extends ConsumerWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsRouter.tabBar(
      // list of your tab routes
      // routes used here must be declared as children
      // routes of /dashboard
      routes: const [
        EventHomeRoute(),
        EventAthletesRoute(),
        EventMenuRoute(),
      ],
      // transitionBuilder: (context, child, animation) => FadeTransition(
      //   opacity: animation,
      //   // the passed child is technically our animated selected-tab page
      //   child: child,
      // ),
      builder: (context, child, controller) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key
        return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                // here we switch between tabs
                tabsRouter.setActiveIndex(index);
              },
              selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
              items: const [
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_filled)),
                BottomNavigationBarItem(label: 'Athletes', icon: Icon(Icons.run_circle_outlined)),
                BottomNavigationBarItem(label: 'Menu', icon: Icon(Icons.menu)),
              ],
            ));
      },
    );
  }
}
