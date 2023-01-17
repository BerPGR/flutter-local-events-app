import 'package:events/model/event.dart';
import 'package:events/model/guest.dart';
import 'package:events/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsContent extends StatelessWidget {
  const EventDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 85,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: Text(
              event.title,
              style: eventWhiteTitleTextStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: FittedBox(
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    event.location,
                    style: eventLocationTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "GUESTS",
              style: guestTextStyle,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final guest in guests)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipOval(
                        child: Image.asset(
                      guest.imagePath,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    )),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
