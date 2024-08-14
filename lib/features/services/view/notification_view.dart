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
                            ? Theme.of(context).colorScheme.secondary
                                : snapshot.data?[index].purifierType == 'AMC'
                                ? Theme.of(context).colorScheme.onPrimary
                                : Colors.red,
                              child: Text("${snapshot.data?[index].name}"[0],style: Theme.of(context).textTheme.displayMedium,),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text('${snapshot.data?[index].name}', style:Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 16))),
                                
                                Expanded(child: Center(child: Text('${snapshot.data?[index].purifierType}',style:Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16)))),
                                Expanded(child: Center(child: Text('${snapshot.data?[index].mobileNumber}',style:Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16)))),
                                Expanded(child: Center(child: Text('${snapshot.data?[index].locality}',style:Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16))))
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
