import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/side_bar_my_plant.dart';

class RegisterPlantPageMyPlant extends StatefulWidget {

  //final VoidCallback showLoginPage;

  const RegisterPlantPageMyPlant({super.key});

  @override
  State<RegisterPlantPageMyPlant> createState() => _RegisterPlantPageMyPlantState();
}

class _RegisterPlantPageMyPlantState extends State<RegisterPlantPageMyPlant> {
  //controllers
  final _namePlantController = TextEditingController();
  final _typePlantController = TextEditingController();
  final _validityOfPlantingLandController = TextEditingController();
  final _timeToWaterThePlantController = TextEditingController();

  @override
  void dispose() {
    _namePlantController.dispose();
    _typePlantController.dispose();
    _validityOfPlantingLandController.dispose();
    _timeToWaterThePlantController.dispose();
    super.dispose();
  }

  Future registerPlant() async {
    addPlantDetails(
        _namePlantController.text.trim(),
        _typePlantController.text.trim(),
        _validityOfPlantingLandController.text.trim(),
        _timeToWaterThePlantController.text.trim(),
      );
  }

  Future addPlantDetails(String namePlant, String typePlant, String validityOfPlantingLand, String timeToWaterThePlant) async {
    await FirebaseFirestore.instance.collection('users').add({
      'namePlant': namePlant,
      'typePlant': typePlant,
      'validityOfPlantingLand': validityOfPlantingLand,
      'timeToWaterThePlant': timeToWaterThePlant,
    }).then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7EEDD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF76453B),
        elevation: 0,
        foregroundColor: const Color(0xFFF7EEDD),
        title: const Text("Cadastrar Planta",
        style: TextStyle(
          //fontSize: 40.00,
          //fontFamily: 'Bebas Neue',
          color: Color(0xFFF7EEDD),
          fontWeight: FontWeight.bold,
        )),
      ),
      body: Center(
        //child: Center(
          child: SingleChildScrollView(
            child:
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                width: 150,
                height: 150,
                child: Image(
                  image: AssetImage('images/my_plant_seed01.png'),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Minha Planta',
                style: TextStyle(
                  fontSize: 40.00,
                  fontFamily: 'Bebas Neue',
                  color: Color(0xFF76453B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _namePlantController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:Color(0xFF76453B)),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Nome da Planta',
                    fillColor: Colors.grey[200],
                    filled: true               
                  ),
                )
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _typePlantController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:Color(0xFF76453B)),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Tipo da Planta',
                    fillColor: Colors.grey[200],
                    filled: true               
                  ),
                )
              ),
              const SizedBox(height: 10),

              //Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _validityOfPlantingLandController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:Color(0xFF76453B)),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Validade da terra',
                    fillColor: Colors.grey[200],
                    filled: true               
                  ),
                )
              ),
              const SizedBox(height: 10),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _timeToWaterThePlantController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF76453B)),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Hora para regar a planta',
                    fillColor: Colors.grey[200],
                    filled: true               
                  ),
                )
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: ()=>{ FirebaseAuth.instance.signOut()},
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xFF1E6F5C),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text(
                        'Salvar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      //)
    ));
  }
}