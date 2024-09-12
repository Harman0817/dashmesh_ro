import 'package:dashmesh_ro/features/dashboard/view/calendar_view.dart';
import 'package:dashmesh_ro/features/dashboard/view/summary_view.dart';
import 'package:dashmesh_ro/features/notification/bloc/notification_bloc.dart';
import 'package:dashmesh_ro/features/notification/view/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
                    create: (BuildContext context)=>NotificationBloc(DateTime.now()),
                    child:Column(
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
                flex: 3,
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8.0),
                  child:  const CalendarPage(),
                ),
              ),
              const Expanded(
                flex: 4,
                child: NotificationPage(),
              ),
            ],
          ),
        )
      ],
    ));
  }
}