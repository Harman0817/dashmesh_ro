import 'package:dashmesh_ro/features/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



import 'documentidupdate/documentidupdate.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  changeDocumentIdsToMobileNumber();

  runApp(const App());
}
