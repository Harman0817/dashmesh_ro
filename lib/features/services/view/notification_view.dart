import 'dart:convert';

import 'package:dashmesh_ro/core/models/notification_model.dart';
import 'package:dashmesh_ro/core/models/service_item.dart';
import 'package:dashmesh_ro/features/services/bloc/service_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/database/db_operation.dart';
import '../../../core/models/customer_model.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(24),
          color:Theme.of(context).colorScheme.onError),
      child: BlocBuilder<ServiceBloc, int>(
        builder: (context, state) {
          return FutureBuilder(
              future: DbOperation.getCustomerAndVisitData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<NotificationModel>> snapshot) {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          print(DbOperation.getCustomerAndVisitData());
                        },
                        leading: CircleAvatar(
                          backgroundColor:
                              snapshot.data?[index].purifierType == 'Set Change'
                                  ? Colors.blue
                                  : snapshot.data?[index].purifierType == 'AMC'
                                      ? Colors.green
                                      : Colors.red,
                          child: Text("${snapshot.data?[index].name}"[0]),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              '${snapshot.data?[index].name}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                            Expanded(
                                child: Text(
                                    '${snapshot.data?[index].purifierType}')),
                            Expanded(
                                child: Text(
                                    '${snapshot.data?[index].mobileNumber}')),
                            Expanded(
                                child:
                                    Text('${snapshot.data?[index].locality}'))
                          ],
                        ),
                        subtitle: Text('${snapshot.data?[index].address}'),
                      );
                    });
              });
        },
      ),
    );
  }
}
