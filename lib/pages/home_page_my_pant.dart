import 'package:cloud_firestore/cloud_firestore.dart';
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
  late final MyPlant myPlant;
  late Future<List<Plant>> _userPlantsFuture;


  @override
  void initState() {
    super.initState();
    myPlant = MyPlant(userID: user!.uid);
    _userPlantsFuture = myPlant.getUserPlants();
  }

  void deletePlant(BuildContext context, String plantId) async {
    try {
      await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('plants')
        .doc(plantId)
        .delete();
      setState(() {
        _userPlantsFuture = myPlant.getUserPlants();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Planta removida com sucesso!'),
          backgroundColor: Color(0xFF1E6F5C),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      print('Erro ao excluir planta: $e');
    }
  }


  
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
            child: FutureBuilder<List<Plant>>(
              future: _userPlantsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}'));
                } else {
                  List<Plant> userPlants = snapshot.data!;
                  return ListView.builder(
                    itemCount: userPlants.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(15),
                    itemBuilder: (context, index) {
                      final plant = userPlants[index];
                      return TilePlantMyPlant(
                        plant: plant, 
                        onDelete: () {
                          deletePlant(context, plant.id); // Chamada da função de exclusão com o ID da planta
                        },
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      )
    );
  }
}