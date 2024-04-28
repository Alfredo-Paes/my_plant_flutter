import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_plant_flutter/auth/main_page_my_plant.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDFKe4pnGGYGilGBevEbTD47RtDx_m_jSM", 
      appId: "1:212986524881:android:7efd1d3dc99c646f1401f0", 
      messagingSenderId: "212986524881", 
      projectId: "my-plant-app-flutter"
    )
  ) :  await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPageMyPlant(),
      routes: {},
    );
  }
}
