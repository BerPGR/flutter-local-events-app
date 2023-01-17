// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events/model/event.dart';
import 'package:events/ui/event_detail/event_details_background.dart';
import 'package:events/ui/event_detail/event_details_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;

  const EventDetailsPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Provider<Event>.value(
      value: event,
      child: Stack(
        fit: StackFit.expand,
        children: [
          EventDetailsBackground(),
          EventDetailsContent(),
        ],
      ),
    ));
  }
}
