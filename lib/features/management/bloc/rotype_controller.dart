import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddorRemoveRoTypeController extends GetxController {
  TextEditingController? addController;

  Future<List<String>> rotype() async {
    List<dynamic>list=[];

    QuerySnapshot query = await FirebaseFirestore.instance.collection('Ro_Type').get();
    for(var doc in query.docs){
      list.add(doc.data());
    }

    for (var data in list){
      type.add('${data['Ro_Type']}');
    }

    return type;
  }

  List<String> type = List.empty(growable: true);

  String selectedType = 'Set Change';

  @override
  void onInit(){
    rotype();
    print(type.length);
    addController = TextEditingController();
    selectedType;
    super.onInit();
  }
  Future addrotype() async{
      CollectionReference documentReference = FirebaseFirestore.instance.collection('Ro_Type');
      await documentReference.add({
        'Ro_Type': addController?.text,
      }).then((_) {
        print("Data added successfully!");
      }).catchError((error) {
        print("Error updating document: $error");
      }).whenComplete(() {
        addController?.clear();
      });

      update();
  }
  Future deleteDocument(String docId) async {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection('Ro_Type').doc(docId);

    await documentReference.delete().then((_) {
      print("Document with ID $docId successfully deleted!");
    }).catchError((error) {
      print("Error deleting document: $error");
    });
  }

  Future removerotype() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Ro_Type')
        .where('Ro_Type', isEqualTo: selectedType)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        print("Found document with ID: ${doc.id}");
        await deleteDocument(doc.id);
      }
    }
  }
}