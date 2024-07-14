import 'package:dashmesh_ro/features/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dashmesh_ro/features/app/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeData,

    );
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   theme: AppThemes.themeData,
    //   routerConfig: AppRouter().generateRoute(),
    // );
  }
}
