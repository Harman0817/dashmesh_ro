import 'package:dashmesh_ro/core/models/customer_model.dart';
import 'package:dashmesh_ro/core/models/notification_model.dart';
import 'package:dashmesh_ro/core/models/visit_model.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:dashmesh_ro/core/shared/ro_logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database_helper.dart';

class DbOperation {
  DbOperation._();

  static storeTableDataInDB(
      {List<VisitModel>? visitsList, List<CustomerModel>? customerList}) async {
    await DatabaseHelper.clearDBTable(DbConstants.TABLE_VISIT_LIST);
    await DatabaseHelper.clearDBTable(DbConstants.TABLE_CUSTOMER_LIST);

    if (visitsList != null) {
      if (visitsList.isNotEmpty) {
        for (var element in visitsList) {
          int? rowId = await DatabaseHelper.insertDataInTable(
              DbConstants.TABLE_VISIT_LIST, element.toJson());
          ROLogger.printLog("rowId    ..TABLE_VISIT_LIST $rowId");
        }
      }
    }

    if (customerList != null) {
      if (customerList.isNotEmpty) {
        for (var element in customerList) {
          int? rowId = await DatabaseHelper.insertDataInTable(
              DbConstants.TABLE_CUSTOMER_LIST, element.toJson());
          ROLogger.printLog("rowId    ..TABLE_CUSTOMER_LIST $rowId");
        }
      }
    }
  }

  static Future<List<dynamic>> getVisitListDataFromDbByCustomerId(
      int customerId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<dynamic> visitList = [];
    QuerySnapshot customerQuery = await firestore
        .collection('Visits')
        .where('Customer_id', isEqualTo: customerId)
        .get();
    for (var doc in customerQuery.docs) {
      visitList.add(doc.data());
    }

    // await DatabaseHelper.fetchMapList(
    //     tableName: DbConstants.TABLE_VISIT_LIST,
    //     where: "${DbConstants.COL_CUSTOMER_ID} = ?",
    //     whereArgs: [customerId]).then(
    //   (dataList) {
    //     if (dataList.isNotEmpty) {
    //       for (var element in dataList) {
    //         VisitModel model = VisitModel.fromJson(element);
    //         visitList.add(model);
    //       }
    //     }
    //   },
    // ).onError((stack, error) {
    //   print(error);
    // });
    return visitList;
  }

  static Future<List<VisitModel>> getVisitListDataFromDb() async {
    List<VisitModel> visitList = [];
    await DatabaseHelper.fetchMapList(tableName: DbConstants.TABLE_VISIT_LIST)
        .then(
      (dataList) {
        if (dataList.isNotEmpty) {
          for (var element in dataList) {
            VisitModel model = VisitModel.fromJson(element);
            visitList.add(model);
          }
        }
      },
    ).onError((stack, error) {
      print(error);
    });
    return visitList;
  }

  static Future<List<dynamic>> getCustomerListDataFromDb() async {
    List<dynamic> customerList = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await firestore.collection('Customer').orderBy('Customer_id').get();
    for (var doc in querySnapshot.docs) {
      customerList.add(doc.data());
    }
    // await DatabaseHelper.fetchMapList(
    //         tableName: DbConstants.TABLE_CUSTOMER_LIST)
    //     .then(
    //   (dataList) {
    //     if (dataList.isNotEmpty) {
    //       for (var element in dataList) {
    //         CustomerModel model = CustomerModel.fromJson(element);
    //         customerList.add(model);
    //       }
    //     }
    //   },
    // );
    return customerList;
  }

  static Future<List<VisitModel>> getVisitListDataFromDbByNotificationDate(
      String date) async {
    List<VisitModel> visitList = [];
    await DatabaseHelper.fetchMapList(
        tableName: DbConstants.TABLE_VISIT_LIST,
        where: "${DbConstants.COL_NOTIFICATION_DATE} = ?",
        whereArgs: [date]).then(
      (dataList) {
        if (dataList.isNotEmpty) {
          for (var element in dataList) {
            VisitModel model = VisitModel.fromJson(element);
            visitList.add(model);
          }
        }
      },
    ).onError((stack, error) {
      print(error);
    });
    return visitList;
  }

  static Future<List<NotificationModel>> getCustomerAndVisitData(
      String date) async {
    print('called $date');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<NotificationModel> fullJoinData = [];
    List<dynamic> visitList = [];
    print('Waheguru');
    QuerySnapshot visitSnap = await firestore
        .collection('Visits')
        .where('Notification_Date', isEqualTo: date)
        .get();
    print(visitSnap.docs.length);
    for (var doc in visitSnap.docs) {
      visitList.add(doc.data());
      print(visitList);
    }
    for (var data in visitList) {
      int custId = data['Customer_id'];
      QuerySnapshot customerSnap = await firestore
          .collection('Customer')
          .where('Customer_id', isEqualTo: custId)
          .get();
      List<dynamic> customerList = [];
      for (var customer_Data in customerSnap.docs) {
        customerList.add(customer_Data);
        print(customerList);
      }
      ;
      for (var data2 in customerList) {
        NotificationModel model = NotificationModel(
          customerId: data2['Customer_id'],
          address: data2['Address'],
          locality: data2['Locality'],
          mobileNumber: data2['Number'],
          name: data2['Name'],
          purifierType: data['Service_Type'],
        );
        fullJoinData.add(model);
      }
      print(fullJoinData);
    }
    // List<dynamic> visitList=[];
    // List<dynamic>customerList=[];
    //
    // for (var doc in customerQuery.docs) {
    //   visitList.add(doc.data());
    // }
    // for (var data in visitList){
    //   String id=data['Customer_id'];
    //   QuerySnapshot query = await firestore.collection('Customer')
    //       .where('Customer_id', isEqualTo: '$id')
    //       .get();
    //   for(var store in query.docs){
    //     customerList.add(store.data());
    //   }
    // }

    // await  DatabaseHelper.fetchJoinResult(date).then(
    //   (dataList) {
    //     print(dataList);
    //     if (dataList.isNotEmpty) {
    //       for (var element in dataList){
    //         NotificationModel model = NotificationModel.fromJson(element);
    //         fullJoinData.add(model);
    //       }
    //     }
    //   },
    // );
    return fullJoinData;
  }

  static Future<List<dynamic>> searchCustomer(String searchText) async {
    print(searchText);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<dynamic> searchList = [];
    List<dynamic> customerList = [];
    List<dynamic> visitList = [];
    QuerySnapshot visitQuery = await firestore.collection('Visits').get();
    QuerySnapshot customerQuery = await firestore.collection('Customer').get();
    for (var doc in customerQuery.docs) {
      customerList.add(doc.data());
    }
    for (var doc in visitQuery.docs) {
      visitList.add(doc.data());
    }
    if (int.tryParse(searchText) != null) {
      QuerySnapshot customeridQuery = await firestore
          .collection('Customer')
          .where('Customer_id', isEqualTo: int.parse(searchText))
          .get();
      for (var doc in customeridQuery.docs) {
        searchList.add(doc.data());
      }
    }

    for (var data in customerList) {
      if ('${data['Name']}'
          .toLowerCase()
          .startsWith('${searchText}'.toLowerCase())) {
        searchList.add(data);
      } else if ('${data['Number']}'
          .toLowerCase()
          .startsWith('${searchText}'.toLowerCase())) {
        searchList.add(data);
      } else if('${data['Locality']}'.toLowerCase().startsWith('${searchText}'.toLowerCase())){
        searchList.add(data);
      } else if('${data['Address']}'.toLowerCase().startsWith('${searchText}'.toLowerCase())){
        searchList.add(data);
      }
    }
    for(var doc in visitList){
          if('${doc['Service_Type']}'.toLowerCase().startsWith('${searchText}'.toLowerCase())){
        int custId = doc['Customer_id'];
        QuerySnapshot customerSnap = await firestore
            .collection('Customer')
            .where('Customer_id', isEqualTo: custId)
            .get();
        for (var data in customerSnap.docs) {
          searchList.add(data.data());
        }
      }
    }
    return searchList;
  }
}
