import 'dart:math'; 
import 'package:flutter/material.dart';

class Pantalla3 extends StatefulWidget {
  final String parametro;

  const Pantalla3({super.key, required this.parametro});

  @override
  State<Pantalla3> createState() => _Pantalla3State();
}

class _Pantalla3State extends State<Pantalla3> {

  final List<String> datosCuriosos = [
    "El juego más premiado en la historia es el shooter de primera persona Half-Life, el cual cuenta con hasta 90 reconocimientos distintos.",
    "El juego con la cinemática más larga es Metal Gear Solid 4, con su escena “Epílogo”. La cinemática tiene el récord Guiness a la más larga pues dura 71 minutos ininterrumpidos, casi tan largo como algunas películas.",
    "Un FPS bastante innovador para su época, fue el GoldenEye 007, fue desarrollado un equipo de no mas de 10 personas quienes en su mayoría no habían trabajado previamente en la industria de los videojuegos..",
    "La primera consola de videojuegos doméstica fue la Magnavox Odyssey.",
    "Super Mario Bros. fue el primer juego en contar con un scrolling lateral continuo."
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
        title: Text(widget.parametro),
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
              child: const Text("Regresar a la pantalla anterior"),
              onPressed: () {
                
                Navigator.pop(context, "¡Regresa para ver más datos curiosos owO!");
              },
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