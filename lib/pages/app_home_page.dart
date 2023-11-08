import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppHomePage extends ConsumerStatefulWidget {
  const AppHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppHomePageState();
}

class _AppHomePageState extends ConsumerState<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/images/zastave.webp",
              width: 200,
              height: 200,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "TEST",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("TEST 2"),
                Text("TEST 3"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
