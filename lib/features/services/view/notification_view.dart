import 'package:dashmesh_ro/core/models/service_item.dart';
import 'package:dashmesh_ro/features/services/bloc/service_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(24),
        color: Colors.grey.shade50
      ),
      child: BlocBuilder<ServiceBloc, int>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: context.read<ServiceBloc>().serviceList.length,
              itemBuilder: (context, index) {
                ServiceItem item = context.read<ServiceBloc>().serviceList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: item.isCompleted?Colors.green:Colors.deepOrange,
                    child: Text(item.name[0]),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(child: Text(item.purifierType)),
                      Expanded(child: Text(item.mobile)),
                      Expanded(child: Text(item.address))
                    ],
                  ),
                  subtitle:Text(item.locality),
                );
              });
        },
      ),
    );
  }
}
