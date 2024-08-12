import 'package:dashmesh_ro/features/services/bloc/notification_bloc.dart';
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
          color:Theme.of(context).colorScheme.onError),
      child: BlocBuilder<NotificationBloc, DateTime>(
        builder: (context, state) {
          return Column(
            children: [
                        Text(context.read<NotificationBloc>().state.toString()),

              Expanded(
                child: FutureBuilder(
                    future: DbOperation.getCustomerListDataFromDb(),
                            
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CustomerModel>> snapshot) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: (){
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
                                Expanded(child: Text('${snapshot.data?[index].name}', style: const TextStyle(fontWeight: FontWeight.bold),)),
                                
                                Expanded(child: Center(child: Text('${snapshot.data?[index].purifierType}'))),
                                Expanded(child: Center(child: Text('${snapshot.data?[index].mobileNumber}'))),
                                Expanded(child: Center(child: Text('${snapshot.data?[index].locality}')))
                              ],
                            ),
                            subtitle:Text('${snapshot.data?[index].address}'),
                          );
                        });
                  }
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
