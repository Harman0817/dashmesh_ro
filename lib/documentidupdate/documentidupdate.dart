import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> changeDocumentIdsToMobileNumber() async {
  // Reference to your Firestore collection
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('Customer');

  // Fetch all documents in the collection
  QuerySnapshot querySnapshot = await collectionRef.get();

  // Iterate through each document
  for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
    // Get the data from the document
    Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

    // Get the mobile_number field from the data
    String mobileNumber = data['number'];

    // Check if the mobile number is valid and not empty
    if (mobileNumber.isNotEmpty) {
      // Create a new document with the mobile number as the document ID
      await collectionRef.doc(mobileNumber).set(data);

      // Delete the original document
      await docSnapshot.reference.delete();
    }
  }
  print("Document IDs changed to mobile number successfully.");

  // // Reference to your Firestore collection
  // CollectionReference collectionRef2 =
  //     FirebaseFirestore.instance.collection('Visits');
  //
  // // Fetch all documents in the collection
  // QuerySnapshot query = await collectionRef2.get();
  //
  // // Iterate through each document
  // for (QueryDocumentSnapshot docSnapshot in query.docs) {
  //   // Get the data from the document
  //   Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
  //
  //   // Get the mobile_number field from the data
  //   String Customer_id = data['Customer_id'];
  //
  //   // Check if the mobile number is valid and not empty
  //   if (Customer_id.isNotEmpty) {
  //     // Create a new document with the mobile number as the document ID
  //     await collectionRef.doc(Customer_id).set(data);
  //
  //     // Delete the original document
  //     await docSnapshot.reference.delete();
  //   }
  // }
  // print("Document IDs changed to Customer_id successfully.");
}
