import 'package:dashmesh_ro/core/database/database_helper.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVisitController extends GetxController {
  List<String> serviceType = ["AMC", "Set Change"];

  TextEditingController? amountController;
  TextEditingController? pendingAmountController;
  TextEditingController? paidAmountController;
  TextEditingController? servicetypeController;
  TextEditingController? gtdurationController;
  TextEditingController? serdurationController;
  TextEditingController? serdateController;
  TextEditingController? noteController;
  TextEditingController? date;

  @override
  void onInit() {
    amountController = TextEditingController();
    paidAmountController = TextEditingController();
    pendingAmountController = TextEditingController();
    servicetypeController = TextEditingController();
    gtdurationController = TextEditingController();
    serdurationController = TextEditingController();
    serdateController = TextEditingController();
    noteController = TextEditingController();
    date = TextEditingController();
    super.onInit();
  }

  addVisit(int customerID) {
    DatabaseHelper.insertDataInTable(DbConstants.TABLE_VISIT_LIST, {
      DbConstants.COL_CUSTOMER_ID: customerID,
      DbConstants.COL_VISIT_DATE: date?.text,
      DbConstants.COL_NOTIFICATION_DATE:
          DateTime.parse(date!.text).add(const Duration(days: 60)).toString(),
      DbConstants.COL_BILLING_AMOUNT: amountController?.text,
      DbConstants.COL_PAID_AMOUNT: paidAmountController?.text,
      DbConstants.COL_VISIT_STATUS: "",
      DbConstants.COL_VISIT_REMARKS: noteController?.text,
      DbConstants.COL_SERVICE_DURATION: serdurationController?.text,
      DbConstants.COL_GUARANTEE_PERIOD: gtdurationController?.text,
      DbConstants.COL_SERVICE_TYPE: "",
    }).onError((error, stackTrace) {
      Get.snackbar('Error', error.toString());
    }).whenComplete(() {
      date?.clear();
      amountController?.clear();
      pendingAmountController?.clear();
      noteController?.clear();
      serdurationController?.clear();
      gtdurationController?.clear();
    });
    ;
    update();
  }
}
