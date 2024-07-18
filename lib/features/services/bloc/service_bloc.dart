import 'package:dashmesh_ro/core/models/service_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceBloc extends Cubit<int> {
  ServiceBloc(super.initialState);

  List<ServiceItem> serviceList = [
    ServiceItem(name: 'Ram',
        mobile: '9685984565',
        address: '121 Lahore, Pakistan',
        lastContactDate: '28-06-2024',
        locality: 'Lahore',
        purifierType: 'AMC',isCompleted: false),
    ServiceItem(name: 'Gobind',
        mobile: '9685984675',
        address: '121 Lahore, Pakistan',
        lastContactDate: '28-06-2024',
        locality: 'Lahore',
        purifierType: 'Set Change',
        isCompleted: true),
  ];
}

