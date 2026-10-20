import 'package:dummy/page/LoginPage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

bool obscurePassword = true;

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerFullname = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerTanggalLahir = TextEditingController();
  TextEditingController controllerJenisKelamin = TextEditingController();
  TextEditingController controllerNoHp = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();
  // ignore: non_constant_identifier_names
  String? SelectedJenisKelamin;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Center(
          child: SizedBox(
            width: 500,
            height: 550,
            child: Card(
              elevation: 10,
              shadowColor: Colors.black,
              color: const Color.fromARGB(255, 123, 198, 233),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controllerFullname,
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          hintText: 'Masukan Nama Lengkap Anda',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controllerEmail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Masukan Email Anda',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controllerTanggalLahir,
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            controllerTanggalLahir.text =
                                "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Tanggal Lahir',
                          hintText: 'Pilih tanggal lahir',
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                          ), // icon kalender di dalam textformfield
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tanggal lahir tidak boleh kosong';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        dropdownColor: const Color.fromARGB(255, 123, 198, 233),
                        borderRadius: BorderRadius.circular(20),
                        value: SelectedJenisKelamin,
                        decoration: InputDecoration(
                          labelText: 'jenis Kelamin',
                          hintText: 'Pilih Jenis Kelamin',
                          prefixIcon: const Icon(Icons.wc),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Laki-Laki',
                            child: Text('Laki-Laki'),
                          ),
                          DropdownMenuItem(
                            value: 'Perempuan',
                            child: Text('Perempuan'),
                          ),
                        ],
                        onChanged: (newValue) {
                          setState(() {
                            SelectedJenisKelamin = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih Jenis Kelamin';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controllerNoHp,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Nomor Hanphonde',
                          hintText: '081234567890',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nomor Handphone Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controllerAlamat,
                        decoration: InputDecoration(
                          labelText: 'Alamat',
                          hintText: 'Masukan Alamat Anda',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Alamat Tidak Boleh Kosong';
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
                          hintText: 'Masukan Password Anda',
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
                          if (value == null || value.isEmpty) {
                            return 'Password Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginpage(
                                  registernamedUsername:
                                      controllerUsername.text,
                                  registernamedPassword:
                                      controllerPassword.text,
                                ),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        child: const Text('Daftar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}