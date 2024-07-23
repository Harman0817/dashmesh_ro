import 'package:dashmesh_ro/core/database/database_helper.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:flutter/material.dart';

//ToDO:This UI has to be updated by Yash
class AddCustomerView extends StatelessWidget {
  const AddCustomerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "COSTUMER DETAIL FORM",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 236,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Enter Name',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)
                                  
                                                    ),
                                            prefixIcon: const Icon(Icons.person)
                                                    ),
                                            
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 236,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Last Name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Enter Last Name',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text("Mobile Number",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'Enter Mobile Number',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                      prefixIcon: const Icon(Icons.phone)
                                      ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Last Contact Date ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'yyyy-mm-dd',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  prefixIcon:
                                      const Icon(Icons.calendar_today_rounded)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Purifier Type ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Type',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                    prefixIcon: const Icon(Icons.type_specimen)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "\nADDRESS DETAIL",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "State",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'Enter State Name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                      prefixIcon: const Icon(Icons.place)
                                      ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text("District",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'Enter District Name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),prefixIcon: const Icon(Icons.place)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Locality",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'Locality',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),prefixIcon: const Icon(Icons.place)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 236,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Street",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Enter Street Name',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                                    prefixIcon: const Icon(Icons.place)
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 236,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Pin Code",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Enter Pin Code',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
