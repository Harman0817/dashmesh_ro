import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashmesh_ro/core/database/database_helper.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVisitController extends GetxController {


  TextEditingController? amountController;
  TextEditingController? faultController;
  TextEditingController? paidAmountController;
  TextEditingController? equipmentlistController;
  TextEditingController? gtdurationController;
  TextEditingController? serdurationController;
  TextEditingController? serdateController;
  TextEditingController? noteController;
  TextEditingController? date;

  List<String> type = ['Set Change','AMC','New RO','Not Applicable'];
  String selectedType = 'Set Change';

  @override
  void onInit() {
    amountController = TextEditingController();
    paidAmountController = TextEditingController();
    faultController = TextEditingController();
    equipmentlistController = TextEditingController();
    gtdurationController = TextEditingController();
    serdurationController = TextEditingController();
    serdateController = TextEditingController();
    noteController = TextEditingController();
    date = TextEditingController();
    super.onInit();
  }

  Future addVisit(var customerID) async  {
     CollectionReference users = FirebaseFirestore.instance.collection('Visits');
    // DatabaseHelper.insertDataInTable(DbConstants.TABLE_VISIT_LIST, {
    //   DbConstants.COL_CUSTOMER_ID: customerID,
    //   DbConstants.COL_VISIT_DATE: date?.text,
    //   DbConstants.COL_NOTIFICATION_DATE:
    //       DateTime.parse(date!.text).add(const Duration(days: 60)).toString(),
    //   DbConstants.COL_BILLING_AMOUNT: amountController?.text,
    //   DbConstants.COL_PAID_AMOUNT: paidAmountController?.text,
    //   DbConstants.COL_VISIT_STATUS: "",
    //   DbConstants.COL_VISIT_REMARKS: noteController?.text,
    //   DbConstants.COL_SERVICE_DURATION: serdurationController?.text,
    //   DbConstants.COL_GUARANTEE_PERIOD: gtdurationController?.text,
    //   DbConstants.COL_SERVICE_TYPE: "",
    // })
     List<String>? equipmentList= equipmentlistController?.text.split(',')??['No Data'];

       List<dynamic>list=[];

       QuerySnapshot querySnapshot = await users.get();
       for (var doc in querySnapshot.docs) {
         list.add(doc.data());
       }

     DateTime Date=DateTime.parse(date!.text);
     DateTime Notification_Date=DateTime(Date.year, Date.month + 2, Date.day);
     users.doc('${list.length + 1}').set({
       'Customer_id':customerID,
       'Bill_Amount':amountController?.text??"00000",
       'Paid_Amount':paidAmountController?.text??'00000',
       'Pending_Amount':'${int.parse(amountController!.text)-int.parse(paidAmountController!.text)}'??'No Data',
       'Equipment_List':equipmentList,
       'Date':date?.text??'0000-00-00 00:00:00',
       'Notification_Date':'$Notification_Date',
       'Guarantee':gtdurationController?.text??'-',
       'Service_Duration':serdurationController?.text??'-',
       'Note':noteController?.text??'--',
       'Service_Type':selectedType,
       'Diary_Number':'--',
       'Fault':faultController?.text??'--',
       'Visit_id':'${list.length + 1}',
     })
    .onError((error, stackTrace) {
      Get.snackbar('Error', error.toString());
    }).whenComplete(() {
      date?.clear();
      amountController?.clear();
      paidAmountController?.clear();
      noteController?.clear();
      faultController?.clear();
      equipmentlistController?.clear();
      serdurationController?.clear();
      gtdurationController?.clear();
    });
    ;
    update();
  }
}
