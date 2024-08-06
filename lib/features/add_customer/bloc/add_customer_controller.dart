import 'package:dashmesh_ro/core/database/database_helper.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCustomerController extends GetxController {
  TextEditingController? nameController;
  TextEditingController? mobileController;
  TextEditingController? lastContactDateController;
  TextEditingController? addressController;
  TextEditingController? districtController;
  TextEditingController? localityController;
  TextEditingController? streetController;
  TextEditingController? pinController;
  List<String> type = ['Set Change','AMC'];
  String selectedType = 'Set Change';


  @override
  onInit() {
    super.onInit();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    lastContactDateController = TextEditingController();
    addressController = TextEditingController();
    districtController = TextEditingController();
    localityController = TextEditingController();
    streetController = TextEditingController();
    pinController = TextEditingController();
  }

  @override
  dispose() {
    super.dispose();
    nameController?.dispose();
    mobileController?.dispose();
    lastContactDateController?.dispose();
    addressController?.dispose();
    districtController?.dispose();
    localityController?.dispose();
    streetController?.dispose();
    pinController?.dispose();
  }

  Future addCustomer() async {
    await DatabaseHelper.insertDataInTable(DbConstants.TABLE_CUSTOMER_LIST, {
      'name': nameController?.text??'-',
      'mobileNumber': mobileController?.text,
      'address': addressController?.text??'-',
      'locality': localityController?.text??'-',
      'lastContactDate': lastContactDateController?.text??'-',
      'purifierType': selectedType
    }).onError((error, stackTrace) {
      Get.snackbar('Error', error.toString());
    }).whenComplete(() {
      nameController?.clear();
      mobileController?.clear();
      addressController?.clear();
      localityController?.clear();
      lastContactDateController?.clear();
      Get.back();
    });
  }
}
