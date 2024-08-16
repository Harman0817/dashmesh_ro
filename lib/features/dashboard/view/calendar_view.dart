import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel<Event>(
      todayButtonColor: Colors.transparent,
      selectedDateTime: DateTime.now(),//ToDo:function to change datetime
      selectedDayTextStyle:const TextStyle(color: Colors.blue),
      selectedDayButtonColor: Colors.transparent,
      weekdayTextStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w400),
      weekendTextStyle:const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      dayPadding:4,
      onDayPressed: (DateTime date, List<Event> events) {},
      //thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      firstDayOfWeek:DateTime.monday,

      daysHaveCircularBorder: true,childAspectRatio: 1.5,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      markedDateMoreShowTotal: true,
      markedDateIconBuilder: (event) {
        return event.icon ?? const Icon(Icons.event_available);
      },  
      minSelectedDate: DateTime.now().subtract(const Duration(days: 360)),
      maxSelectedDate: DateTime.now().add(const Duration(days: 360)),
      onCalendarChanged: (DateTime date) {
      },
    );
  }
}