import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarrc_app/backend/supabase/supabase.dart';
import 'package:sarrc_app/router/navigation_observer.dart';
import 'package:sarrc_app/router/router.dart';

Future<void> main(List<String> args) async {
  await SupaFlow.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(ProviderScope(child: MyApp(savedThemeMode: savedThemeMode)));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key, this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: textThemeLight,
          appBarTheme: appBarThemeLight,
          listTileTheme: ListTileThemeData(tileColor: Theme.of(context).dividerColor),
          inputDecorationTheme: const InputDecorationTheme(labelStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(selectedItemColor: primaryColor, unselectedItemColor: Colors.grey[600], backgroundColor: Colors.white),
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF112855),
          scaffoldBackgroundColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          textTheme: textThemeDark,
          appBarTheme: appBarThemeDark,
          listTileTheme: ListTileThemeData(tileColor: Theme.of(context).dividerColor),
          inputDecorationTheme: const InputDecorationTheme(labelStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(selectedItemColor: primaryColor, unselectedItemColor: Colors.white, backgroundColor: Colors.black),
        ),
        initial: savedThemeMode ?? AdaptiveThemeMode.system,
        builder: (theme, dark) {
          return MaterialApp.router(
            title: 'SARRC',
            routerConfig: ref.read(appRouterProvider).config(navigatorObservers: () => [MyObserver()]),
            theme: theme,
            darkTheme: dark,
          );
        });
  }
}

var primaryColor = const Color(0xFF112855);

TextTheme textThemeDark = const TextTheme(
  displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
  titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
  bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white),
);
TextTheme textThemeLight = const TextTheme(
  displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
  titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
  bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black),
);

AppBarTheme appBarThemeDark = AppBarTheme(
  titleTextStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
  backgroundColor: primaryColor,
  actionsIconTheme: const IconThemeData(color: Colors.white),
  iconTheme: const IconThemeData(color: Colors.white),
);
AppBarTheme appBarThemeLight = AppBarTheme(
  titleTextStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
  backgroundColor: primaryColor,
  actionsIconTheme: const IconThemeData(color: Colors.white),
  iconTheme: const IconThemeData(color: Colors.white),
);
