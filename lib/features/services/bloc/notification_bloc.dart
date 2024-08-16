import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Cubit<DateTime> {

  NotificationBloc(super.initialState);

  set text(String text) {}

  changeDate(DateTime date) {
    emit(date);
  }
}
