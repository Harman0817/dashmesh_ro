import 'package:dashmesh_ro/features/dashboard/view/calendar_view.dart';
import 'package:dashmesh_ro/features/services/view/notification_view.dart';
import 'package:dashmesh_ro/features/dashboard/view/summary_view.dart';
import 'package:dashmesh_ro/features/services/view/service_page.dart';
import 'package:flutter/material.dart';

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
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const CalendarPage(),
                ),
              ),
              const Expanded(
                flex: 4,
                child: ServicePage(),
              ),
            ],
          ),
        )
      ],
    );
  }
}