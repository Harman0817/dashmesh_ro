import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 3,
          child: ServiceSummary(),
        ),
        Expanded(
          flex: 9,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const CalendarPage(),
                ),
              ),
              const Expanded(
                flex: 3,
                child: NotificationView(),
              ),
            ],
          ),
        )
      ],
    );
  }
}

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
      // height: 420.0,
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

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return ListTile(
            title:RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Ro Service for Yash Grover   ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'AMC   ',
                    style: TextStyle(
                      color: Colors.green,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: '9876543241',
                    style: TextStyle(
                      color: Colors.indigo  ,
                      fontSize: 18,fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            subtitle:const Text('West Delhi'),
            trailing: const Icon(FontAwesomeIcons.whatsapp),
          );
        });
  }
}

class ServiceSummary extends StatelessWidget {
  const ServiceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.purple,
            height: 200,
            width: 200,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.dangerous_sharp),
                Text('Total Count', style: TextStyle(
                  fontSize: 24
                ),),
                Text('5', style: TextStyle(
                    fontSize: 28
                ),),
              ],
            ),
          ),
        );
      }),
    );
  }
}
