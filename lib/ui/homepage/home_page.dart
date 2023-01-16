import 'package:events/app_state.dart';
import 'package:events/model/category.dart';
import 'package:events/model/event.dart';
import 'package:events/styleguide.dart';
import 'package:events/ui/event_detail/event_details_page.dart';
import 'package:events/ui/homepage/category_widget.dart';
import 'package:events/ui/homepage/event_widget.dart';
import 'package:events/ui/homepage/home_page_backgroud.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: [
            HomePageBackground(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: [
                          Text(
                            'LOCAL EVENTS',
                            style: fadedTextStyle,
                          ),
                          Spacer(),
                          Icon(
                            Icons.person_outline,
                            color: Color(0x99FFFFFF),
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        "What's up",
                        style: whiteHeadingTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (final category in categories)
                                  CategoryWidget(category: category)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) {
                          return Column(
                            children: [
                              for (final event in events.where((e) => e
                                  .categoryIds
                                  .contains(appState.selectedCategoryId)))
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EventDetailsPage(event: event))),
                                  child: EventWidget(event: event),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
