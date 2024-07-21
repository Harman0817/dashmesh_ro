import 'package:dashmesh_ro/core/database/database_helper.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:flutter/material.dart';

//ToDO:This UI has to be updated by Yash
class AddCustomerView extends StatelessWidget {
  const AddCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Mobile Number'),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Address'),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Locality'),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Last Contact Date'),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Purifier Type'),
          ),
          ElevatedButton(
            onPressed: () {
              DatabaseHelper.insertDataInTable(
                  DbConstants.TABLE_CUSTOMER_LIST, {
                'name': 'name',
                'mobileNumber': 'mobileNumber',
                'address': 'address',
                'locality': 'locality',
                'lastContactDate': 'lastContactDate',
                'purifierType': 'purifierType'
              });
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}
