import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashmesh_ro/core/database/database_helper.dart';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCustomerController extends GetxController {
  TextEditingController? nameController;
  TextEditingController? mobileController;
  TextEditingController? dairyController;
  TextEditingController? addressController;
  TextEditingController? districtController;
  TextEditingController? localityController;
  TextEditingController? noteController;
  TextEditingController? rotypeController;
  List<String> type = ['Set Change','AMC'];
  String selectedType = 'Set Change';


  @override
  onInit() {
    super.onInit();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    dairyController = TextEditingController();
    addressController = TextEditingController();
    districtController = TextEditingController();
    localityController = TextEditingController();
    noteController = TextEditingController();
    rotypeController = TextEditingController();
  }

  @override
  dispose() {
    super.dispose();
    nameController?.dispose();
    mobileController?.dispose();
    dairyController?.dispose();
    addressController?.dispose();
    districtController?.dispose();
    localityController?.dispose();
    noteController?.dispose();
    rotypeController?.dispose();
  }

  Future addCustomer() async {
    CollectionReference users = FirebaseFirestore.instance.collection('Customer');
    List<dynamic>list=[];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Customer').get();
    for (var doc in querySnapshot.docs) {
      list.add(doc.data());
    }
    users.doc(mobileController?.text??'-------').set({
      'Customer_id':'${list.length+1}',
      'Name': nameController?.text??'--',
      'Number': mobileController?.text??'--',
      'Address': addressController?.text??'--',
      'Locality': localityController?.text??'--',
      'Ro_Type':rotypeController?.text??'--',
      'Note': noteController?.text?? '--',
      'Dairy_Number':dairyController?.text??'--',
    }).onError((error, stackTrace) {
      Get.snackbar('Error', error.toString());
    }).whenComplete(() {
      dairyController?.clear();
      nameController?.clear();
      mobileController?.clear();
      addressController?.clear();
      localityController?.clear();
      rotypeController?.clear();
      noteController?.clear();
      Get.back();
    });
  }
}
