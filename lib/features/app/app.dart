// import 'package:dashmesh_ro/features/app/bloc/theme_bloc.dart';
// import 'package:dashmesh_ro/features/app/bloc/theme_state.dart';
import 'package:dashmesh_ro/features/home/view/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
          home:  const HomePage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff162c9a),
              primary:const  Color(0xff162c9a),
              // brightness: Brightness.light,
              secondary: const Color(0xfffaaa20),
                tertiary:const Color(0xff2e2e2e),
            ),
              scaffoldBackgroundColor: Colors.white ,
    textTheme:  TextTheme(
    displayLarge:  TextStyle(
    fontSize:34,
    fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.tertiary,

    ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w300,
          color: Theme.of(context).colorScheme.tertiary,
      ),

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
