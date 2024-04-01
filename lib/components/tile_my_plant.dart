import 'package:flutter/material.dart';
import 'package:my_plant_flutter/models/plants.dart';

class TilePlantMyPlant extends StatelessWidget {
  final Plant plant;

  const TilePlantMyPlant({
    super.key,
    required this.plant
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF76453B),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF43766C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: const Image(
                    image: AssetImage('images/my_plant_logo01.png'),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              Text('Planta: ${plant.namePlant}',
                style: const TextStyle(
                  color: Color(0xFFF7EEDD),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
          
              Text('Tipo de planta: ${plant.typePlant}',
                style: const TextStyle(
                  color: Color(0xFFF7EEDD),
                  fontSize: 20,
                ),
              ),
              Text('Trocar terra: ${plant.validityOfPlantingLand}',
                style: const TextStyle(
                  color: Color(0xFFF7EEDD),
                  fontSize: 20,
                ),
              ),
              Text('Hora de regar: ${plant.timeToWaterThePlant}',
                style: const TextStyle(
                  color: Color(0xFFF7EEDD),
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Adicione a lógica do primeiro botão aqui
                    },
                    icon: const Icon(
                      Icons.edit, 
                      color: Colors.white, // Cor do ícone
                    ), 
                    label: const Text(''), // Label vazia para o primeiro botão
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF41C9E2)), // Cor de fundo do botão
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10)), // Espaçamento interno do botão
                    ),
                  ),
                  const SizedBox(width: 20), // Espaçamento entre os botões
                  ElevatedButton.icon(
                    onPressed: () {
                      // Adicione a lógica do segundo botão aqui
                    },
                    icon: const Icon(
                      Icons.delete, 
                      color: Colors.white, // Cor do ícone
                    ), 
                    label: const Text(''), // Label vazia para o segundo botão
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFC51605)), // Cor de fundo do botão
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10)), // Espaçamento interno do botão
                    ),
                  ),
                ],
              ),
            ] 
          ),
        ]
      ),
    );
  }
}

 