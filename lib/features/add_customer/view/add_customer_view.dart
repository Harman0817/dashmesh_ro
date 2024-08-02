import 'package:dashmesh_ro/core/database/database_helper.dart';
import 'package:dashmesh_ro/core/database/db_operation.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:dashmesh_ro/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:intl/intl.dart';

class AddCustomerView extends StatefulWidget {
  const AddCustomerView({super.key});

  @override
  State<AddCustomerView> createState() => _AddCustomerViewState();
}

class _AddCustomerViewState extends State<AddCustomerView> {
  SingleValueDropDownController? type_selected;
  TextEditingController _date = TextEditingController();
  TextEditingController? state = new TextEditingController()..text = "Delhi";
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
                              StringConstants.customerDetails,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                SizedBox(
                                  width: 236,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        StringConstants.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: StringConstants.enterName,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            prefixIcon:
                                                const Icon(Icons.person)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 236,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        StringConstants.lastName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText:
                                                StringConstants.enterLastName,
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
                            const Text(StringConstants.mobileNumber,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              maxLength: 10,
                              decoration: InputDecoration(
                                  hintText: StringConstants.enterMobileNumber,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  prefixIcon: const Icon(Icons.phone)),
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
                              controller: _date,
                              decoration: InputDecoration(
                                  hintText: 'MM/DD/YYYY',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  prefixIcon:
                                      const Icon(Icons.calendar_today_rounded)),
                              onTap: () async {
                                DateTime? pickeddate = await showDatePicker(
                                    context: context,
                                    firstDate:
                                        DateTime(DateTime.now().year - 70),
                                    currentDate: DateTime.now(),
                                    lastDate:
                                        DateTime(DateTime.now().year + 70));
                                if (pickeddate != null) {
                                  setState(() {
                                    _date.text =
                                        DateFormat.yMd().format(pickeddate);
                                  });
                                }
                              },
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
                            DropDownTextField(
                                textFieldDecoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  prefixIcon:
                                      const Icon(Icons.type_specimen_rounded),
                                  hintText: "Select Type",
                                ),
                                controller: type_selected,
                                clearOption: true,
                                isEnabled: true,
                                dropDownList: const [
                                  DropDownValueModel(name: "AMC", value: 1),
                                  DropDownValueModel(
                                      name: "Set Change", value: 2)
                                ],
                                onChanged: (value) {}),
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
                              StringConstants.state,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              controller: state,
                              decoration: InputDecoration(
                                  hintText: StringConstants.enterState,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  prefixIcon: const Icon(Icons.place)),
                            ),
                            const SizedBox(height: 15),
                            const Text(StringConstants.district,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: StringConstants.enterDistrict,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  prefixIcon: const Icon(Icons.place)),
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
                                      borderRadius: BorderRadius.circular(5)),
                                  prefixIcon: const Icon(Icons.place)),
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
                                            prefixIcon:
                                                const Icon(Icons.place)),
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
                onPressed: () async {
                await  DatabaseHelper.insertDataInTable(
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
              //Create a text that fetches the customer list from the database and displays it
              FutureBuilder(
                  future: DbOperationClass.getCustomerListDataFromDb(),
                  builder: (context, snapshot) {
                return Text(snapshot.data.toString());
              })

            ],
          ),
        ),
      ),
    );
  }
}

List<String> type = ['Set Change', "AMC"];
