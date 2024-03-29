import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:my_plant_flutter/pages/forgot_password_page_my_plant.dart";

class LoginPageMyPlant extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPageMyPlant({super.key, required this.showRegisterPage});

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                         MaterialPageRoute(builder: (context) {
                            return ForgotPasswordPagemyPlant();
                         })
                        );
                      },
                      child: const Text(
                        'Esqueci a senha.',
                        style: TextStyle(
                          color: Color(0xFF008DDA), fontWeight: FontWeight.bold)
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),

              //Botão de entrar
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Possui registro?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text(
                      ' Cadastrar.',
                      style: TextStyle(
                          color: Color(0xFF008DDA), fontWeight: FontWeight.bold),
                    ),
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
