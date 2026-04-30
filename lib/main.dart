
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
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      // 🔹 Text
      const Text(
        'Películas Populares',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 16),

      // 🔹 Container + Row + Column
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 5),
          ],
        ),
        child: Row(
          children: [

            // Imagen simulada
            Container(
              width: 80,
              height: 120,
              color: Colors.grey,
            ),

            const SizedBox(width: 10),

            // 🔹 Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Efecto Mariposa',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('2008'),
                  Text('Historia sobre viajes en el tiempo'),
                ],
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 20),

      // 🔹 Stack
      Stack(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.blueGrey,
          ),
          const Positioned(
            top: 10,
            left: 10,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                'TOP 10',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
),
      ),
    );
  }
}
