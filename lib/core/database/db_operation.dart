import 'package:dashmesh_ro/core/models/customer_model.dart';
import 'package:dashmesh_ro/core/models/notification_model.dart';
import 'package:dashmesh_ro/core/models/visit_model.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:dashmesh_ro/core/shared/ro_logger.dart';
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

  static Future<List<VisitModel>> getVisitListDataFromDbByCustomerId(
      int customerId) async {
    List<VisitModel> visitList = [];
    await DatabaseHelper.fetchMapList(
        tableName: DbConstants.TABLE_VISIT_LIST,
        where: "${DbConstants.COL_CUSTOMER_ID} = ?",
        whereArgs: [customerId]).then(
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

  static Future<List<CustomerModel>> getCustomerListDataFromDb() async {
    List<CustomerModel> customerList = [];
    await DatabaseHelper.fetchMapList(
            tableName: DbConstants.TABLE_CUSTOMER_LIST)
        .then(
      (dataList) {
        if (dataList.isNotEmpty) {
          for (var element in dataList) {
            CustomerModel model = CustomerModel.fromJson(element);
            customerList.add(model);
          }
        }
      },
    );
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

static Future<List<NotificationModel>> getCustomerAndVisitData(String date) async {
    print('called $date');
  List<NotificationModel> fullJoinData = [];
    await  DatabaseHelper.fetchJoinResult(date).then(
      (dataList) {
        print(dataList);
        if (dataList.isNotEmpty) {
          for (var element in dataList){
            NotificationModel model = NotificationModel.fromJson(element);
            fullJoinData.add(model);
          }
        }
      },
    );
    return fullJoinData;
  }

  static Future<List<CustomerModel>> searchCustomer(String searchText) async{
    print(searchText);
    List<CustomerModel> customerList = [];
    await DatabaseHelper.fetchSearchResult(searchText)
        .then(
          (dataList) {
        if (dataList.isNotEmpty) {
          for (var element in dataList) {
            CustomerModel model = CustomerModel.fromJson(element);
            customerList.add(model);
          }
        }
      },
    );
    return customerList;

  }

}
