import 'package:dashmesh_ro/features/notification/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime? selectedDay;
  @override
  void initState() {
    selectedDay = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, DateTime>(builder: (context, state) {

      return CalendarCarousel<Event>(
        key: ValueKey(state),
        selectedDateTime: context.read<NotificationBloc>().state,
        selectedDayTextStyle: const TextStyle(color: Colors.green),
        ///styling for selected date
        selectedDayButtonColor: Colors.transparent,
        selectedDayBorderColor: Colors.transparent,
        ///styling for Today
        todayTextStyle: const TextStyle(color: Colors.black),
        todayBorderColor: Colors.transparent,
        todayButtonColor: Colors.blueGrey.shade50,
        ///styling for all other days
        daysTextStyle: const TextStyle(color: Colors.black),
        // dayButtonColor: Colors.yellow,

        weekdayTextStyle: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w400),
        weekendTextStyle: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w400),
        dayPadding: 4,
        onDayPressed: (DateTime date, List<Event> events) {
          context.read<NotificationBloc>().changeDate(date);
        },
        //thisMonthDayBorderColor: Colors.grey,
        weekFormat: false,
        daysHaveCircularBorder: true, childAspectRatio: 1.5,
        markedDateShowIcon: true,
        markedDateIconMaxShown: 2,
        markedDateMoreShowTotal: true,
        markedDateIconBuilder: (event) {
          return event.icon ?? const Icon(Icons.event_available);
        },
        minSelectedDate: DateTime.now().subtract(const Duration(days: 360)),
        maxSelectedDate: DateTime.now().add(const Duration(days: 360)),
        onCalendarChanged: (DateTime date) {},

      );
    });
  }
}
