import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
      },
      weekendTextStyle:const TextStyle(color: Colors.red),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      selectedDateTime: DateTime.now(),
      daysHaveCircularBorder: false,childAspectRatio: 1.5,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      markedDateMoreShowTotal: true,
      markedDateIconBuilder: (event) {
        return event.icon ?? const Icon(Icons.event_available);
      },
      todayButtonColor: Colors.transparent,
      selectedDayTextStyle:const TextStyle(color: Colors.yellow),
      minSelectedDate: DateTime.now().subtract(const Duration(days: 360)),
      maxSelectedDate: DateTime.now().add(const Duration(days: 360)),
      onCalendarChanged: (DateTime date) {
      },
    );
  }
}