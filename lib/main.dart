/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba'
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          // Contenido principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [

                Text(
                  'Bienvenido',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  'Catálogo de Películas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokemonScreen(),
    );
  }
}

class PokemonScreen extends StatefulWidget {
  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  String nombre = "";
  String imagen = "";
  int altura = 0;
  int peso = 0;

  Future<void> obtenerPokemon() async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/pikachu'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        nombre = data['name'];
        imagen = data['sprites']['front_default'];
        altura = data['height'];
        peso = data['weight'];
      });
    } else {
      throw Exception('Error al cargar Pokémon');
    }
  }

  @override
  void initState() {
    super.initState();
    obtenerPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PokéAPI App"),
      ),
      body: Center(
        child: nombre.isEmpty
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(imagen),
                  Text(
                    nombre.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Altura: $altura"),
                  Text("Peso: $peso"),
                ],
              ),
      ),
    );
  }
}