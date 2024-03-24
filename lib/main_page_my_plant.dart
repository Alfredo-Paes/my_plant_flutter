 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_plant_flutter/home_page_my_pant.dart';
import 'package:my_plant_flutter/login_page_my_plant.dart';

class MainPageMyPlant extends StatelessWidget {
  const MainPageMyPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) { 
          if(snapshot.hasData) {
            return HomePageMyPlant();
          } else {
            return LoginPageMyPlant();
          }
         },),
    );
  }
}