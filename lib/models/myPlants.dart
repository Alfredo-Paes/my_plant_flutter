import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_plant_flutter/models/plants.dart';

class MyPlant {
  final String userID;

  MyPlant({required this.userID});

  Future<List<Plant>> getUserPlants() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('plants')
        .get();

    List<Plant> userPlants = [];
    querySnapshot.docs.forEach((doc) {
      Plant plant = Plant(
        id: doc.id,
        namePlant: doc['namePlant'],
        typePlant: doc['typePlant'],
        validityOfPlantingLand: doc['validityOfPlantingLand'],
        timeToWaterThePlant: doc['timeToWaterThePlant'],
      );
      userPlants.add(plant);
    });

    return userPlants;
  }
}