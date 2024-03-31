import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPagemyPlant extends StatefulWidget {
  const ForgotPasswordPagemyPlant({super.key});

  @override
  State<ForgotPasswordPagemyPlant> createState() => _ForgotPasswordPagemyPlantState();
}

class _ForgotPasswordPagemyPlantState extends State<ForgotPasswordPagemyPlant> {

  //controllers
  final _emailcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }
  //Função responsável para o envia de email
  Future sendEmail() async {
     
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailcontroller.text.trim()
      );
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (context) {
        return const AlertDialog(
          content: Text('Link enviado. Verifique o seu Email!'),
        );
      });
    } on FirebaseAuthException catch(e) {
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7EEDD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF76453B),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text('Insira o seu Email. Vamos enviar um link, para gerar uma nova senha',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                  )),
              ),
              const SizedBox(height: 10),
              //Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:Color(0xFF76453B)),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Email',
                    fillColor: Colors.grey[200],
                    filled: true               
                  ),
                )
              ),
              const SizedBox(height: 10),
              
              MaterialButton(
                color: const Color(0xFF1E6F5C),
                onPressed: sendEmail, 
                child: const Text(
                  'Enviar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              )
            ]
          ),
        ),
      )
    ));
  }
}