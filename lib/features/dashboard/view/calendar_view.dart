import 'package:cloud_firestore/cloud_firestore.dart';
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
  DateTime selectedDay= DateTime.now();
  EventList<Event> _markedDateMap = EventList<Event>(events: {});

  Future<void> _fetchNotificationDates() async {

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Visits').get();

    for (var doc in snapshot.docs) {
      DateTime notificationDate = DateTime.parse(doc['Notification_Date']);


      _markedDateMap.add(
        notificationDate,
        Event(
          date: notificationDate,
          title: 'Notification',
          icon: const Icon(Icons.account_circle, color: Colors.indigo,size:0,),

        ),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    _fetchNotificationDates();
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
        dayPadding: 5,
        onDayPressed: (DateTime date, List<Event> events) {

          context.read<NotificationBloc>().changeDate(date);
        },
        markedDatesMap: _markedDateMap,
        //thisMonthDayBorderColor: Colors.grey,
        weekFormat: false,
        daysHaveCircularBorder: true, childAspectRatio: 1.5,
        markedDateShowIcon: true,
        markedDateIconMaxShown: 0,
        markedDateMoreShowTotal: true,
        markedDateMoreCustomDecoration: const BoxDecoration(
          color: Colors.indigo, // Color of the notification count circle
          shape: BoxShape.circle,
        ),
        markedDateMoreCustomTextStyle: const TextStyle(
          color: Colors.white, // Color of the number inside the circle
          fontSize: 9,
        ),
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
