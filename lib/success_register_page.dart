import 'package:flutter/material.dart';

class SuccessRegister extends StatefulWidget {
  final String? nim, fullname, password;

  const SuccessRegister({
    super.key,
    required this.nim,
    required this.fullname,
    required this.password,
  });

  @override
  State<SuccessRegister> createState() => _SuccessRegisterState();
}

class _SuccessRegisterState extends State<SuccessRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selamat Datang'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('NIM : ${widget.nim}'),
            Text('Nama Lengkap : ${widget.fullname}'),
            Text('Password : ${widget.password}'),
          ],
        ),
      ),
    );
  }
}
