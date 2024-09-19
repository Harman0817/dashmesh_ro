import 'package:cloud_firestore/cloud_firestore.dart';

class Count {
  static Future<int> countAmc() async{
int countAmc=0;
List<dynamic> customerList = [];
FirebaseFirestore firestore = FirebaseFirestore.instance;
QuerySnapshot querySnapshot = await firestore.collection('Visits').get();
for (var doc in querySnapshot.docs) {
  customerList.add(doc.data());
}
for (var amc in customerList){
  if ('${amc['Service_Type']}'.toLowerCase()=='amc'){
    countAmc++;
  }
}
print(countAmc);
return countAmc;
  }
  static Future<int> countnewro() async{
    int countNewRo=0;
    List<dynamic> customerList = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('Visits').get();
    for (var doc in querySnapshot.docs) {
      customerList.add(doc.data());
    }
    for (var amc in customerList){
      if ('${amc['Service_Type']}'.toLowerCase()=='new ro'){
        countNewRo++;
      }
    }
    print(countNewRo);
    return countNewRo;
  }
  static Future<int> countService() async{
    int countService=0;
    List<dynamic> customerList = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('Visits').get();
    for (var doc in querySnapshot.docs) {
      customerList.add(doc.data());
    }
    for (var amc in customerList){
      if ('${amc['Service_Type']}'.toLowerCase()!='amc' && '${amc['Service_Type']}'.toLowerCase()!='new ro'){
        countService++;
      }
    }
    print(countService);
    return countService;
  }
  static Future<int> countTotal() async{
    int counttotal=0;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('Visits').get();
    for (var doc in querySnapshot.docs) {
      counttotal++;
    }

    print(counttotal);
    return counttotal;
  }
 }