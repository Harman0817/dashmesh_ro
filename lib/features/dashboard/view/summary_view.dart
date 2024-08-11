import 'package:dashmesh_ro/core/models/summary_item.dart';
import 'package:dashmesh_ro/features/home/bloc/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

//ToDo: Tanmeet update the UI

class ServiceSummary extends StatelessWidget {
  const ServiceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.center,
      child: Builder(
        builder: (context) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: context.read<HomeCubit>().summaryList.length,
              itemBuilder: (context, index){
                SummaryItem item = context.read<HomeCubit>().summaryList[index];
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    decoration:  BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                        Theme.of(context).colorScheme.onPrimary,Theme.of(context).colorScheme.primary
                      ]),
                        borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(
                        color: Theme.of(context).colorScheme.tertiary,
                        offset:const Offset(4,4),
                        spreadRadius: 4,
                        blurRadius: 12

                      )]
                    ),
                    height: 225,
                    width: 215,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item.title, style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor
                        ),),
                        SizedBox(height: 5,),
                        Text('${item.count}', style: GoogleFonts.quicksand(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 28
                        ),),
                      ],
                    ),
                  ),
                );
              });
        }
      ),
    );
  }
}