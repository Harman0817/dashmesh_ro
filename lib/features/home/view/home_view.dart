import 'dart:ui';
import 'package:dashmesh_ro/features/home/bloc/home_cubit.dart';
import 'package:dashmesh_ro/features/home/bloc/sidebar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: SizedBox(
            height: 200,
            child: Center( child:Text('Dashmesh Mechanix', style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.secondary,
            ),)),)
      ),
      body: BlocBuilder<HomeCubit, SidebarState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                  flex: 2,
                  child: ListView.builder(
                      itemCount: context.read<HomeCubit>().sidebarMenu.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => context.read<HomeCubit>().changeState(
                                context
                                        .read<HomeCubit>()
                                        .sidebarMenu[index]
                                        .state ??
                                    DashboardSelected()),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  context
                                          .read<HomeCubit>()
                                          .sidebarMenu[index]
                                          .title ??
                                      '',
                                  style: TextStyle(
                                    fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: context
                                                  .read<HomeCubit>()
                                                  .sidebarMenu[index]
                                                  .title ==
                                              state.title
                                          ? Theme.of(context).colorScheme.secondary
                                          : Theme.of(context).colorScheme.primary),
                                ),
                              ),
                            ),
                          )),
              Expanded(flex: 10, child: Container(
                child: Center(
                  child: context
                      .read<HomeCubit>()
                      .state.layout,
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}
