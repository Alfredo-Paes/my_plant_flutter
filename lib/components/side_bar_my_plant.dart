// ignore_for_file: unnecessary_const

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_plant_flutter/components/side_bar_options_my_plant.dart';
import 'package:my_plant_flutter/pages/login_page_my_plant.dart';
import 'package:my_plant_flutter/pages/register_plant_page_my_plant.dart';

class SideBarMyPlant extends StatelessWidget {
  final VoidCallback onSignOut; // Tipo de função que aceita callbacks sem parâmetros

  const SideBarMyPlant({Key? key, required this.onSignOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1E6F5C),
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: SizedBox(
                width: 110,
                height: 110,
                child: Image(
                  image: AssetImage('images/my_plant_logo02.png'),
                ),
              ),
            ),
          ),
          SideBarOptionsMyPlant(
            text: 'Cadastrar Planta', 
            icon: Icons.app_registration, 
            onTap: () {
              _navigateToRegisterPlantPage(context);
            },
          ),
          SideBarOptionsMyPlant(
            text: 'Minhas Plantas', 
            icon: Icons.grass_outlined, 
            onTap: () {
              print('Minhas Plantas');
            },
          ),
          SideBarOptionsMyPlant(
            text: 'Sair', 
            icon: Icons.logout, 
            onTap: onSignOut, // Chama a função de logout fornecida como propriedade
          ),
        ]
      ),
    );
  }

  void toggleScreens() {
    const loginPage = true;
  }

  void _navigateToRegisterPlantPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPlantPageMyPlant()));
  }

  /*void _navigateToLoginPage(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPageMyPlant(showRegisterPage: () { toggleScreens; },)),(route) => false);
  }*/
}