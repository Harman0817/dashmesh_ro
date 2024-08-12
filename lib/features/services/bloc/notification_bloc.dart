import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Cubit<DateTime> {

  NotificationBloc(super.initialState);

  changeDate(DateTime date) {
    emit(date);
  }
}
