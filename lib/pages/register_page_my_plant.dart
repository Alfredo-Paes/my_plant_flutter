import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPageMyPlant extends StatefulWidget {

  final VoidCallback showLoginPage;

  const RegisterPageMyPlant({
    Key? key,
    required this.showLoginPage,
  }): super(key: key);

  @override
  State<RegisterPageMyPlant> createState() => _RegisterPageMyPlantState();
}

class _RegisterPageMyPlantState extends State<RegisterPageMyPlant> {
  //controllers
  final _emailcontroller = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordIsConfirmed()) {
      // Criação de usuário
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(), 
        password: _passwordController.text.trim(),
      );
      //Adicionar detalhes do usuário
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailcontroller.text.trim()
      );
    }
  }

  Future addUserDetails(String firstName, String lastName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
    }).then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  bool passwordIsConfirmed() {
    //Validação para confirmação de senha
    if (_passwordController.text.trim() == _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7EEDD),
      body: SafeArea(
        child: Center(
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
                'Cadastro',
                style: TextStyle(
                  fontSize: 40.00,
                  fontFamily: 'Bebas Neue',
                  color: Color(0xFF76453B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              //First Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:Color(0xFF76453B)),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Nome',
                    fillColor: Colors.grey[200],
                    filled: true               
                  ),
                )
              ),
              const SizedBox(height: 10),

              //Last Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:Color(0xFF76453B)),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Sobrenome',
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
                child: TextField(
                  controller: _confirmPasswordController,
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
                    hintText: 'Confirmar senha',
                    fillColor: Colors.grey[200],
                    filled: true               
                  ),
                )
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signUp,
                    
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xFF1E6F5C),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text(
                        'Cadastrar',
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
                  const Text('Já tenho cadastro!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: const Text(
                      ' Entrar',
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