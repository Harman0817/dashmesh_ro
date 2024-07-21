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
          child: Container(
            decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("COSTUMER DETAIL FORM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                  const SizedBox(height: 25,),
                  Row(
                    children: [
                      SizedBox(
                        width:400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Name",style: TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Name',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                              
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      SizedBox(
                        width:400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Mobile Number",style: TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Mobile Number',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                              
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Text("Address",style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5,),
                  TextField(
                    maxLines:3 ,
                    decoration: InputDecoration(
                      hintText: 'Enter Address',
                      
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    
                    ),
                  ),
                  const SizedBox(height: 15,),
                  const Text("Locality",style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  TextField(
                    decoration: InputDecoration(labelText: 'Locality',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    
                    ),

                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      SizedBox(
                        width:400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Last Contact Date ",style: TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'yyyy-mm-dd',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              prefixIcon:const Icon(Icons.calendar_today_rounded)
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      SizedBox(
                        width:400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Purifier Type",style: TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Type',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                              
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Center(
                    child: ElevatedButton(
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
