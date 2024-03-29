 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_plant_flutter/auth/auth_page_my_plant.dart';
import 'package:my_plant_flutter/pages/home_page_my_pant.dart';

class MainPageMyPlant extends StatelessWidget {
  const MainPageMyPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) { 
          if(snapshot.hasData) {
            return const HomePageMyPlant();
          } else {
            return const AuthPageMyPlant();
          }
         },
      ),
    );
  }
}