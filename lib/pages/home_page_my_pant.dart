import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_plant_flutter/components/side_bar_my_plant.dart';

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
      backgroundColor: const Color(0xFFF7EEDD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF76453B),
        elevation: 0,
        foregroundColor: const Color(0xFFF7EEDD),
        title: Text("Olá ${user?.email}",
        style: const TextStyle(
          //fontSize: 40.00,
          //fontFamily: 'Bebas Neue',
          color: Color(0xFFF7EEDD),
          fontWeight: FontWeight.bold,
        )),
      ),
      drawer: SideBarMyPlant(
        onSignOut: () { 
          FirebaseAuth.instance.signOut();
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Text('Logado como: ${user?.email}'),
            MaterialButton(onPressed: (){
              FirebaseAuth.instance.signOut();
            },
            color: Colors.deepPurple[200],
            child: const Text('Sair'),
            )
          ],
        ),
      ),
    );
  }
}