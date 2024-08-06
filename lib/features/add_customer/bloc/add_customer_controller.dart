import 'package:dashmesh_ro/core/database/database_helper.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCustomerController extends GetxController {
  TextEditingController? nameController;
  TextEditingController? mobileController;
  TextEditingController? lastContactDateController;
  TextEditingController? stateController;
  TextEditingController? districtController;
  TextEditingController? localityController;
  TextEditingController? streetController;
  TextEditingController? pinController;
  List<DropdownItem> type = [
    DropdownItem('1', 'Set Change'),
    DropdownItem('2', 'AMC')
  ];

  String selectedType = 'Set Change';

  final _isLoading = false.obs;
  set isLoading(value) => this._isLoading.value = value;
  get isLoading => this._isLoading.value;

  @override
  onInit() {
    super.onInit();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    lastContactDateController = TextEditingController();
    stateController = TextEditingController();
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
    stateController?.dispose();
    districtController?.dispose();
    localityController?.dispose();
    streetController?.dispose();
    pinController?.dispose();
  }

  // Future<void> addCustomer() async {
  //   isLoading = true;
  //   try {
  //     isLoading = false;
  //     Get.back();
  //   } catch (e) {
  //     isLoading = false;
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  Future addCustomer() async {
    await DatabaseHelper.insertDataInTable(DbConstants.TABLE_CUSTOMER_LIST, {
      'name': nameController?.text,
      'mobileNumber': mobileController?.text,
      'address': streetController?.text,
      'locality': localityController?.text,
      'lastContactDate': lastContactDateController?.text,
      'purifierType': selectedType
    }).onError((error, stackTrace) {
      Get.snackbar('Error', error.toString());
    }).whenComplete(() {
      Get.back();
    });
  }
}

class DropdownItem {
  final String value;
  final String label;

  DropdownItem(this.value, this.label);
}
