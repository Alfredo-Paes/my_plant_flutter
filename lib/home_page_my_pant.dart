import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageMyPlant extends StatefulWidget {
  const HomePageMyPlant({super.key});

  @override
  State<HomePageMyPlant> createState() => _HomePageMyPlantState();
}

class _HomePageMyPlantState extends State<HomePageMyPlant> {
  final user = FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Text('Logado como: ${user?.email}')
          ],
        ),
      ),
    );
  }
}