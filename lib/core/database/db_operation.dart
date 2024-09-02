import 'package:dashmesh_ro/core/models/customer_model.dart';
import 'package:dashmesh_ro/core/models/notification_model.dart';
import 'package:dashmesh_ro/core/models/visit_model.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:dashmesh_ro/core/shared/ro_logger.dart';
import 'package:firebase_core/firebase_core.dart';
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
      var customerId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<dynamic> visitList = [];
    QuerySnapshot customerQuery = await firestore.collection('Visits')
        .where('Customer_id', isEqualTo: '$customerId')
        .get();
    for (var doc in customerQuery.docs) {
      visitList.add(doc.data() );
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
    QuerySnapshot querySnapshot = await firestore.collection('Customer').get();
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

  static Future<List<VisitModel>> getVisitListDataFromDbByNotificationDate(String date) async {
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

static Future<List<dynamic>> getCustomerAndVisitData(String date) async {
    print('called $date');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<dynamic> fullJoinData = [];
    QuerySnapshot customerQuery = await firestore.collection('Visits')
        .where('Notification_Date', isEqualTo: '$date')
        .get();
    List<dynamic> list=[];
    List<dynamic>Store=[];
    for (var doc in customerQuery.docs) {
      list.add(doc.data());
    }
    for (var data in list){
      String id=data['Customer_id'];
      QuerySnapshot query = await firestore.collection('Customer')
          .where('Customer', isEqualTo: '$id')
          .get();
      for(var store in query.docs){
        Store.add(store.data());
      }
    }
    for (var StoredData in list){

    }
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

  static Future<List<dynamic>> searchCustomer(String searchText) async{
    print(searchText);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<dynamic> customerList = [];
    QuerySnapshot nameQuery = await firestore.collection('Customer')
        .where('name', isGreaterThanOrEqualTo: '$searchText')
        .where('name', isLessThan: '$searchText' + 'z')
        .get();
    QuerySnapshot numberQuery = await firestore.collection('Customer')
        .where('number', isGreaterThanOrEqualTo: '$searchText')
        .where('number', isLessThan: '$searchText' + 'z')
        .get();
    QuerySnapshot localityQuery = await firestore.collection('Customer')
        .where('locality', isGreaterThanOrEqualTo: '$searchText')
        .where('locality', isLessThan: '$searchText' + 'z')
        .get();
    QuerySnapshot addressQuery = await firestore.collection('Customer')
        .where('address', isGreaterThanOrEqualTo: '$searchText')
        .where('address', isLessThan: '$searchText' + 'z')
        .get();
    for (var doc in nameQuery.docs) {
      customerList.add(doc.data() );
    }
    for (var doc in numberQuery.docs) {
      customerList.add(doc.data());
    }
    for (var doc in localityQuery.docs) {
      customerList.add(doc.data() );
    }
    for (var doc in addressQuery.docs) {
      customerList.add(doc.data());
    }
    return customerList;

  }

}
