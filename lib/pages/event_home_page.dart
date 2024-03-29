import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class EventHomePage extends ConsumerStatefulWidget {
  const EventHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EventHomePageState();
}

class _EventHomePageState extends ConsumerState<EventHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        leading: BackButton(
          onPressed: () {
            AutoRouter.of(context).pop();
            // if (AutoRouter.of(context).canNavigateBack) {
            //   return AutoRouter.of(context).back();
            // }
          },
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: true,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_image.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
