import 'package:dashmesh_ro/core/database/database_helper.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVisitController extends GetxController {
  List<String> serviceType = ["AMC", "Set Change"];

  TextEditingController? amountController;
  TextEditingController? servicetypeController;
  TextEditingController? gtdurationController;
  TextEditingController? serdurationController;
  TextEditingController? serdateController;
  TextEditingController? noteController;
  TextEditingController? date;

  @override
  void onInit() {
    amountController = TextEditingController();
    servicetypeController = TextEditingController();
    gtdurationController = TextEditingController();
    serdurationController = TextEditingController();
    serdateController = TextEditingController();
    noteController = TextEditingController();
    date = TextEditingController();
    super.onInit();
  }

  addVisit() {
    DatabaseHelper.insertDataInTable(DbConstants.TABLE_VISIT_LIST, {
      // DbConstants.COL_CUSTOMER_ID: "",
      DbConstants.COL_VISIT_DATE: date?.text,
      DbConstants.COL_BILLING_AMOUNT: amountController?.text,
      DbConstants.COL_VISIT_STATUS: "",
      DbConstants.COL_VISIT_REMARKS: noteController?.text,
      DbConstants.COL_SERVICE_DURATION: serdurationController?.text,
      DbConstants.COL_GUARANTEE_PERIOD: gtdurationController?.text,
      DbConstants.COL_SERVICE_TYPE: "",
    });
    update();
  }
}
