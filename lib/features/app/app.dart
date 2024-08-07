import 'package:dashmesh_ro/features/app/bloc/theme_bloc.dart';
import 'package:dashmesh_ro/features/app/bloc/theme_state.dart';
import 'package:dashmesh_ro/features/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>ThemeBloc(),
      child:   BlocBuilder<ThemeBloc, ThemeState>(
        builder:(context, state)=>  GetMaterialApp(
          home:  const HomePage(),
          debugShowCheckedModeBanner: false,
          theme: state.themeData,
        ),
      ),
    );
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   theme: AppThemes.themeData,
    //   routerConfig: AppRouter().generateRoute(),
    // );
  }
}
