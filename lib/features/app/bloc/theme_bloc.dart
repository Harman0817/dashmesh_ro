// import 'dart:async';
// import 'package:dashmesh_ro/features/app/bloc/theme_event.dart';
// import 'package:dashmesh_ro/features/app/bloc/theme_state.dart';
// import 'package:dashmesh_ro/features/app/themes.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc() : super(ThemeState(themeData: appThemeData[AppTheme.light]!));
//
//
//   Stream<ThemeState> mapEventToState(
//     ThemeEvent event,
//   ) async* {
//     if (event is ThemeChanged) {
//       yield ThemeState(themeData: appThemeData[event.theme]!);
//     }
//   }
// }
