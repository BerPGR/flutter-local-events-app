// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events/model/event.dart';
import 'package:events/styleguide.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                event.imagePath,
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: eventTitleTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                event.location,
                                style: eventLocationTextStyle,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      textAlign: TextAlign.right,
                      event.duration.toUpperCase(),
                      style: eventLocationTextStyle.copyWith(
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
