import 'package:dashmesh_ro/features/services/bloc/service_bloc.dart';
import 'package:dashmesh_ro/features/services/view/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context)=>ServiceBloc(0),
      child: const NotificationView(),
    );
  }
}
