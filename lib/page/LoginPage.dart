import 'package:dummy/page/HomePage.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  final String? registernamedUsername;
  final String? registernamedPassword;

  const Loginpage({
    super.key,
    this.registernamedUsername,
    this.registernamedPassword,
    });

  @override
  State<Loginpage> createState() => _LoginPage();
}

bool obscurePassword = true;

class _LoginPage extends State<Loginpage> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Center(
          child: SizedBox(
            width: 250,
            height: 250,
            child: Card(
              elevation: 10,
              shadowColor: Colors.black,
              color: const Color.fromARGB(255, 123, 198, 233),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controllerUsername,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Masukan Username Anda',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (Value) {
                        if (Value!.isEmpty) {
                          return 'Username Tidak Boleh Kosong';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: obscurePassword,
                      controller: controllerPassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'masukan Password anda',
                        suffixIcon: IconButton( icon: Icon(
                            obscurePassword ? 
                            Icons.visibility_off: Icons.visibility,
                            ),
                            onPressed: (){
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                          ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        String User = widget.registernamedUsername ?? 'admin';
                        String Pass = widget.registernamedPassword ?? '1234';
                        if (formkey.currentState!.validate()) {
                          if (controllerUsername.text == User &&
                              controllerPassword.text == Pass) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                              (route) => false,
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Konfirmasi Login"),
                                  content: Text('Username atau Password salah'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        controllerUsername.text = '';
                                        controllerPassword.text = '';
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("ok"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}