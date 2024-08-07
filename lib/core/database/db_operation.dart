import 'package:dashmesh_ro/core/models/customer_model.dart';
import 'package:dashmesh_ro/core/models/visit_model.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:dashmesh_ro/core/shared/ro_logger.dart';

import 'database_helper.dart';

class DbOperation {
  DbOperation._();

  static storeTableDataInDB({List<VisitModel>? visitsList, List<CustomerModel>? customerList}) async {
    await DatabaseHelper.clearDBTable(DbConstants.TABLE_VISIT_LIST);
    await DatabaseHelper.clearDBTable(DbConstants.TABLE_CUSTOMER_LIST);

if(visitsList!=null) {
  if (visitsList.isNotEmpty) {
      for (var element in visitsList) {
        int? rowId = await DatabaseHelper.insertDataInTable(
            DbConstants.TABLE_VISIT_LIST, element.toJson());
        ROLogger.printLog("rowId    ..TABLE_VISIT_LIST $rowId");
      }
    }
}

if(customerList!=null) {
  if(customerList.isNotEmpty){
      for (var element in customerList) {
        int? rowId = await DatabaseHelper.insertDataInTable(
            DbConstants.TABLE_CUSTOMER_LIST, element.toJson());
        ROLogger.printLog("rowId    ..TABLE_CUSTOMER_LIST $rowId");
      }
    }
}
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
    );
    return visitList;
  }

  static Future<List<CustomerModel>> getCustomerListDataFromDb() async {
    List<CustomerModel> customerList = [];
    await DatabaseHelper.fetchMapList(tableName: DbConstants.TABLE_CUSTOMER_LIST)
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
