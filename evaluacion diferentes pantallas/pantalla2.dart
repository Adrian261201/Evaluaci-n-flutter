import 'dart:math'; 
import 'package:flutter/material.dart';
import 'pantalla3.dart';

class Pantalla2 extends StatefulWidget {
  const Pantalla2({super.key});

  @override
  State<Pantalla2> createState() => _Pantalla2State();
}

class _Pantalla2State extends State<Pantalla2> {

  final List<String> datosCuriosos = [
    "El primer videojuego de la historia fue creado en 1958 por William Higinbotham, llamado Tennis for Two.",
    "En 1980, Pac-Man se convirtió en el primer videojuego en tener un personaje principal con nombre propio.",
    "El videojuego más vendido de todos los tiempos es 'Minecraft'.",
    "Red Dead Redemption 2 permaneció en desarrollo durante 8 años. Fueron necesarios 700 actores de voz, 300.000 animadores, 500 actores para captura de movimientos, 500.000 líneas de diálogo y más de 1000 desarrolladores para terminarlo.",
    "La saga más extensa de videojuegos le pertenece a Mega Man, de Capcom. Desde su inicio en 1987, la franquicia cuenta con más de 40 títulos. Además, si se suman las apariciones de Mega Man en otros juegos, la suma alcanza los 93 videojuegos."
  ];

  
  String datoCuriosoActual = '';

  @override
  void initState() {
    super.initState();
    
    datoCuriosoActual = _obtenerDatoCuriosoAleatorio();
  }

  String _obtenerDatoCuriosoAleatorio() {
    final random = Random();
    int index = random.nextInt(datosCuriosos.length);
    return datosCuriosos[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Datos Curiosos sobre Juegos"),
        backgroundColor: Colors.purple, 
      ),
      backgroundColor: Colors.purple[50], 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dato curioso: $datoCuriosoActual',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Ir a la siguiente pantalla para ver más"),
              onPressed: () async {
                
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pantalla3(
                      parametro: datoCuriosoActual,
                    ),
                  ),
                );

               
                if (resultado != null) {
                  setState(() {
                    
                    datoCuriosoActual = _obtenerDatoCuriosoAleatorio();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Resultado: $resultado")));
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, 
                onPrimary: Colors.white, 
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               
                Navigator.pop(context);
              },
              child: const Text("Regresar al Inicio"),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, 
                onPrimary: Colors.white, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}