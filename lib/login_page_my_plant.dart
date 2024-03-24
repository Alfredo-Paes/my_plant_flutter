import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class LoginPageMyPlant extends StatefulWidget {
  const LoginPageMyPlant({super.key});

  @override
  State<LoginPageMyPlant> createState() => _LoginPageMyPlantState();
}

class _LoginPageMyPlantState extends State<LoginPageMyPlant> {
  //controllers
  final _emailcontroller = TextEditingController();
  final _passwordController = TextEditingController();

  //Função responsável para login
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailcontroller.text.trim(), 
      password: _passwordController.text.trim()
    );
    print('clicou');
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7EEDD),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                width: 310,
                height: 310,
                child: Image(
                  image: AssetImage('images/my_plant_logo01.png'),
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
              
              //Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _passwordController,
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
                    hintText: 'Senha',
                    fillColor: Colors.grey[200],
                    filled: true               
                  ),
                )
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signIn,
                    
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xFF1E6F5C),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text(
                        'Entrar',
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
              const SizedBox(height: 10),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Possui registro?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    ' Cadastrar.',
                    style: TextStyle(
                        color: Color(0xFF008DDA), fontWeight: FontWeight.bold),
                  )
                ],
              )
            ]
          ),
        ),
      )
    ));
  }
}
