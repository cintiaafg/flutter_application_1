
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Aquí ponemos el título que pide tu actividad
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
          backgroundColor: Colors.blue,
        ),
        // Aquí ponemos el texto en el centro
        body: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
