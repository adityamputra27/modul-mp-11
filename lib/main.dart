import 'package:flutter/material.dart';
import 'package:modul_mp_11/success_register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nim = TextEditingController();
  final fullname = TextEditingController();
  final password = TextEditingController();

  void storeStudents() async {
    final localStorage = await SharedPreferences.getInstance();

    localStorage.setString('nim', nim.text.toString());
    localStorage.setString('fullname', fullname.text.toString());
    localStorage.setString('password', password.text.toString());

    String? userNim = localStorage.getString('nim');
    String? userFullname = localStorage.getString('fullname');
    String? userPassword = localStorage.getString('password');

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SuccessRegister(
          nim: userNim,
          fullname: userFullname,
          password: userPassword,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Shared Preferences'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Masukkan NIM',
              ),
              controller: nim,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Masukkan Nama Lengkap',
              ),
              controller: fullname,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Masukkan Password',
              ),
              obscureText: true,
              controller: password,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => storeStudents(),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'Simpan',
              ),
            )
          ],
        ),
      ),
    );
  }
}
