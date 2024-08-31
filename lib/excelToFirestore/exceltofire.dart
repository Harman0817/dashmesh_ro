import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';

excelToFirebase() {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<dynamic> excelData = [];
  var file = File("C:/229_sample_dashmesh_mechanix.xlsx").readAsBytesSync();
  var excel = Excel.decodeBytes(file);
  int min=0;
  int max=229;
  for (var table in excel.tables.keys) {
    for (var row in excel.tables[table]!.rows) {
      List<dynamic> list = [];
      if (min==max){
        break;
      }
      if (row.isNotEmpty) {
        list.add(row.length > 1? row[0]?.value ?? 'No Data' : 'No Data'); // Customer id
        list.add(row.length > 2 ? row[2]?.value ?? 'No Data' : 'No Data'); // number
        list.add(row.length > 3 ? row[3]?.value ?? 'No Data' : 'No Data'); // name
        list.add(row.length > 4 ? row[3]?.value ?? 'No Data' : 'No Data'); // address
        list.add(row.length > 5 ? row[4]?.value ?? 'No Data' : 'No Data'); // locality
        list.add(row.length > 6 ? row[5]?.value ?? 'No Data' : 'No Data'); // service type
        list.add(row.length > 7 ? row[6]?.value ?? 'No Data' : 'No Data'); // bill amount
        list.add(row.length > 8 ? row[7]?.value ?? 'No Data' : 'No Data'); // paid amount
        list.add(row.length > 9 ? row[8]?.value ?? 'No Data' : 'No Data'); // pending amount
        list.add(row.length > 11 ? row[10]?.value??'No Data' : 'No Data'); // guarantee
        list.add(row.length > 16 ? row[15]?.value??'No Data' : 'No Data'); // landmark

      }
      excelData.add(list);
      min++;
    }
  }

  Future<void> storeExcelDataToCustomer(List<dynamic> excelData) async {
    CollectionReference collectionRef = firestore
        .collection('Customer');

    for (var dataRow in excelData) {
      // Prepare a map for Firestore data
      Map<String, dynamic> data = {
        'number': dataRow[0] ,
        'name': dataRow[1] ,
        'address': dataRow[2] ,
        'locality': dataRow[3] ,
        'service_type': dataRow[4],
      };

      // Add the data to Firestore
      await collectionRef.add(data);
    }
  }


// Call this function after parsing the Excel data
  storeExcelDataToCustomer(excelData);
}
