import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_plant_flutter/components/side_bar_my_plant.dart';
import 'package:my_plant_flutter/models/myPlants.dart';
import 'package:my_plant_flutter/models/plants.dart';

import '../components/tile_my_plant.dart';

class HomePageMyPlant extends StatefulWidget {
  const HomePageMyPlant({super.key});

  @override
  State<HomePageMyPlant> createState() => _HomePageMyPlantState();
}

class _HomePageMyPlantState extends State<HomePageMyPlant> {
  final user = FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    
    final MyPlant myPlant = MyPlant();

    return Scaffold(
      backgroundColor: const Color(0xFFF7EEDD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF76453B),
        elevation: 0,
        foregroundColor: const Color(0xFFF7EEDD),
        title: Text("Olá ${user?.email}",
        style: const TextStyle(
          color: Color(0xFFF7EEDD),
          fontWeight: FontWeight.bold,
        )),
      ),
      drawer: SideBarMyPlant(
        onSignOut: () { 
          FirebaseAuth.instance.signOut();
        },
      ),
      body: ListView(
        children: [
          const SizedBox(height: 25),
          const Center(
            child: Text('Suas plantas registradas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xFF76453B)),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: myPlant.myPlants.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final plant = myPlant.myPlants[index];
                return TilePlantMyPlant(plant: plant,);
              },
            ),
          )
        ],
      )
    );
  }
}