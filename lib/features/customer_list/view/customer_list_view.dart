import 'package:dashmesh_ro/core/database/db_operation.dart';
import 'package:dashmesh_ro/core/models/customer_model.dart';
import 'package:dashmesh_ro/features/add_visit/view/add_visit_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerListView extends StatefulWidget {
  const CustomerListView({super.key});

  @override
  State<CustomerListView> createState() => _CustomerListViewState();
}

class _CustomerListViewState extends State<CustomerListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(backgroundColor: Colors.blue, radius: 12),
              SizedBox(width: 10),
              Text('Set Change'),
              SizedBox(width: 100),
              CircleAvatar(backgroundColor: Colors.green, radius: 12),
              SizedBox(width: 10),
              Text('AMC'),
              SizedBox(width: 100),
              CircleAvatar(backgroundColor: Colors.red, radius: 12),
              SizedBox(width: 10),
              Text('Error'),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: DbOperation.getCustomerListDataFromDb(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CustomerModel>> snapshot) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            snapshot.data?[index].purifierType == 'Set Change'
                                ? Colors.blue
                                : snapshot.data?[index].purifierType == 'AMC'
                                    ? Colors.green
                                    : Colors.red,
                      ),
                      title: Text(
                          '${snapshot.data?[index].name} - ${snapshot.data?[index].lastContactDate}'),
                      subtitle: Text(
                          '${snapshot.data?[index].locality} - ${snapshot.data?[index].mobileNumber}'),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(FontAwesomeIcons.house),
                                onPressed: () {
                                  if (snapshot.data != null &&
                                      snapshot.data?[index].id != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddVisitView(
                                                customerID: snapshot
                                                    .data![index].id!)));
                                  }
                                }),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.whatsapp),
                              onPressed: () => launchUrl(
                                  Uri.parse(
                                      'https://wa.me/${snapshot.data?[index].mobileNumber}?text=Hello%20${snapshot.data?[index].name}'),
                                  mode: LaunchMode.externalApplication),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                );
              }),
        ),
      ],
    );
  }
}
