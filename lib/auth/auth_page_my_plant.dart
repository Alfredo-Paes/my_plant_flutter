import 'package:flutter/material.dart';
import 'package:my_plant_flutter/pages/login_page_my_plant.dart';
import 'package:my_plant_flutter/pages/register_page_my_plant.dart';

class AuthPageMyPlant extends StatefulWidget {
  const AuthPageMyPlant({super.key});

  @override
  State<AuthPageMyPlant> createState() => _AuthPageMyPlantState();
}

class _AuthPageMyPlantState extends State<AuthPageMyPlant> {
  //inicialmente, mostra a tela de login
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPageMyPlant(showRegisterPage: toggleScreens);
    } else {
      return RegisterPageMyPlant(showLoginPage: toggleScreens);
    }
  }
}