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
        title:Container(
            height: 200,
            color: Colors.amber,
            child: const Text('Dashmesh RO', style: TextStyle(
              color: Colors.black
            ),)),
      ),
      body: BlocBuilder<HomeCubit, SidebarState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(color: Colors.black),
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
                                          color: context
                                                      .read<HomeCubit>()
                                                      .sidebarMenu[index]
                                                      .title ==
                                                  state.title
                                              ? Colors.green
                                              : Colors.black),
                                    ),
                                  ),
                                )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.sunny),
                            Switch(value: true, onChanged: (_){
                              print(_);
                            }),
                            const Icon(Icons.dark_mode),
                          ],
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 10,
                  child: Container(
                    child: Center(
                      child: context.read<HomeCubit>().state.layout,
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
