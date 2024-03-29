import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarrc_app/router/router.gr.dart';

import '../widgets/list_items/event_list_item_card_widget.dart';

@RoutePage()
class AppHomePage extends ConsumerStatefulWidget {
  const AppHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppHomePageState();
}

class _AppHomePageState extends ConsumerState<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SARRC',
          style: TextStyle(color: Colors.black),
        ),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return GestureDetector(
                  onTap: () => AutoRouter.of(context).navigate(const EventRoute()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 16,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/Swiss_Epic_Logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Absa Cape Epic',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Text(
                        'Cape Town, South Africa',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '17-24 March 2024',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              } else {
                return SizedBox(
                  height: 150,
                  child: EventListItemCardWidget(
                    title: 'Event $index',
                    location: 'Location $index',
                    date: 'Date $index',
                    onTap: () => AutoRouter.of(context).navigate(const EventRoute()),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
