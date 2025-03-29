import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tarefas',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: AnimatedOpacity(
          opacity: opacity ? 1 : 0,
          duration: Duration(milliseconds: 800),
          child: ListView(
            children: const [
              Task('Aprender Fluter', 'assets/images/flutter.png', 3),
              Task('Andar de Bike', 'assets/images/bike.jpeg', 5),
              Task('Meditar', 'assets/images/meditar.jpeg', 2),
              Task('Ler', 'assets/images/ler.jpg', 1),
              Task('Jogar', 'assets/images/jogar.jpg', 2),
              SizedBox(height: 100)
            ],
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacity = !opacity;
            });
          },
          child: Icon(Icons.remove_red_eye)),
    );
  }
}
