import 'package:dashmesh_ro/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:dashmesh_ro/features/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        child: const DashboardView(),
        create: (BuildContext context)=>DashboardBloc(0));
  }
}
