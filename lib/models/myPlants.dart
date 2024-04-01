import 'package:my_plant_flutter/models/plants.dart';

class MyPlant {
  final List<Plant> _myPlants = [
    Plant(
      namePlant: 'Planta 01', 
      typePlant: 'Erva', 
      validityOfPlantingLand: '31/12/2024', 
      timeToWaterThePlant: '15:00' 
    ),
    Plant(
      namePlant: 'Planta 02', 
      typePlant: 'Arvore', 
      validityOfPlantingLand: '31/07/2024', 
      timeToWaterThePlant: '08:00' 
    ),
  ];

  List<Plant> get myPlants => _myPlants;

  void editPlant(Plant item) {
    _myPlants.add(item);
  }

  void removePlant(Plant item) {
    _myPlants.remove(item);
  }
  
}