import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AthletesDetailsPage extends ConsumerWidget {
  const AthletesDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: const Text("DETAILS PAGE"),
      ),
    );
  }
}
