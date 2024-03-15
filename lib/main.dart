import 'package:flutter/material.dart';

import 'views/widgets/label_password.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var data = 'Generador de Contraseñas';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(data),
          backgroundColor: Colors.blueGrey,
        ),
        body: const LabelPassword(),
      ),
    );
  }
}
