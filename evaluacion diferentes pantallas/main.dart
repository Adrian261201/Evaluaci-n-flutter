import 'package:flutter/material.dart';
import 'pantalla2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: PantallaInicio(),
    );
  }
}

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido a Datos Curiosos de Juegos"),
        backgroundColor: Colors.purple, 
      ),
      backgroundColor: Colors.purple[50], 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Dale al botón para ver datos curiosos sobre Videojuegos :3",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pantalla2(),
                  ),
                );
              },
              child: const Text("Ver Datos Curiosos"),
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
