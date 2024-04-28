import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


import 'home_page_my_pant.dart';

class RegisterPlantPageMyPlant extends StatefulWidget {
  const RegisterPlantPageMyPlant({super.key});

  @override
  State<RegisterPlantPageMyPlant> createState() =>
      _RegisterPlantPageMyPlantState();
}

class _RegisterPlantPageMyPlantState extends State<RegisterPlantPageMyPlant> {
  //controllers
  final _namePlantController = TextEditingController();
  final _typePlantController = TextEditingController();
  final _validityOfPlantingLandController = TextEditingController();
  final _timeToWaterThePlantController = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(mask: '##/##/####', filter: {'#': RegExp(r'[0-9]')});
  final timeFormatter = MaskTextInputFormatter(mask: '##:##', filter: {'#': RegExp(r'[0-9]')});

  // Obtenha a instância do FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  void dispose() {
    _namePlantController.dispose();
    _typePlantController.dispose();
    _validityOfPlantingLandController.dispose();
    _timeToWaterThePlantController.dispose();
    super.dispose();
  }

  Future registerPlant(BuildContext context) async {
    User? user = _auth.currentUser;
    String formatDate(String dateString) {
      // Parse a string no formato "dd/mm/yyyy" para um objeto DateTime
      DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(dateString);
      // Formate a data para uma string no formato "dd/mm/yyyy"
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    }
    String formattedDate = formatDate(_validityOfPlantingLandController.text.trim());

    if (user != null) {
      String userID = user.uid;
      addPlantDetails(
        userID,
        _namePlantController.text.trim(),
        _typePlantController.text.trim(),
        formattedDate,
        _timeToWaterThePlantController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Planta registrada com sucesso!'),
          backgroundColor: Color(0xFF1E6F5C),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const HomePageMyPlant()),
      );
    } else {
      print("Nenhum usuário autenticado");
    }
  }

  Future addPlantDetails(
    String userID,
    String namePlant,
    String typePlant,
    String validityOfPlantingLand, 
    String timeToWaterThePlant
  ) async {

    await FirebaseFirestore.instance
    .collection('users')
    .doc(userID)
    .collection("plants")
    .add({
      'namePlant': namePlant,
      'typePlant': typePlant,
      'validityOfPlantingLand': validityOfPlantingLand,
      'timeToWaterThePlant': timeToWaterThePlant,
    });
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
              color: Color(0xFFF7EEDD),
              fontWeight: FontWeight.bold,
            )),
        ),
        body: Center(
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
                          borderSide:
                              const BorderSide(color: Color(0xFF76453B)),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Nome da Planta',
                      fillColor: Colors.grey[200],
                      filled: true),
                )),
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
                          borderSide:
                              const BorderSide(color: Color(0xFF76453B)),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Tipo da Planta',
                      fillColor: Colors.grey[200],
                      filled: true),
                )),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _validityOfPlantingLandController,
                  inputFormatters: [maskFormatter], // Adicione a máscara de entrada aqui
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF76453B)),
                      borderRadius: BorderRadius.circular(12)),
                    hintText: 'Validade da terra', // Altere o hintText para orientar o usuário sobre o formato esperado
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _timeToWaterThePlantController,
                  inputFormatters: [timeFormatter], // Adicione a máscara de entrada aqui
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF76453B)),
                      borderRadius: BorderRadius.circular(12)),
                    hintText: 'Horário para regar a planta', // Altere o hintText para orientar o usuário sobre o formato esperado
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () => registerPlant(context),
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
            ]),
          ),
        ));
  }
}
