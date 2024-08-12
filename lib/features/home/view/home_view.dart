import 'dart:ui';
import 'package:dashmesh_ro/features/home/bloc/home_cubit.dart';
import 'package:dashmesh_ro/features/home/bloc/sidebar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          flexibleSpace:Container(
            decoration: BoxDecoration(
              gradient:LinearGradient(colors: [
                Theme.of(context).colorScheme.onPrimary,Theme.of(context).colorScheme.primary
              ])
            )
          ),
        title: SizedBox(
            height: 200,
            child: Center( child:Text('Dashmesh Mechanix', style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),)),)
      ),

      body: BlocBuilder<HomeCubit, SidebarState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.grey.shade100
                    //  Theme.of(context).colorScheme.secondary
                     ,
                    child: ListView.builder(
                        itemCount: context.read<HomeCubit>().sidebarMenu.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () => context.read<HomeCubit>().changeState(
                                  context
                                          .read<HomeCubit>()
                                          .sidebarMenu[index]
                                          .state ??
                                      DashboardSelected(),

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  padding:  const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                  color: 
                                  context
                                                        .read<HomeCubit>()
                                                        .sidebarMenu[index]
                                                        .title ==
                                                    state.title?
                                  Theme.of(context).colorScheme.onPrimary:Colors.transparent,
                                  ),
                                  
                                  child: Center(
                                    child: Text(
                                        context
                                                .read<HomeCubit>()
                                                .sidebarMenu[index]
                                                .title ??
                                            '',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                            // fontWeight: FontWeight.bold,
                                            color: context
                                                        .read<HomeCubit>()
                                                        .sidebarMenu[index]
                                                        .title ==
                                                    state.title
                                                ? Theme.of(context).scaffoldBackgroundColor
                                                :Colors.black
                                                //  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4)
                                                ),
                                      ),
                                  ),
                                ),
                                ),
                              ),
                            ),
                  )
              ),

              Expanded(flex: 10, child: Container(            child: Center(
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


