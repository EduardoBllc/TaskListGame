import 'package:flutter/material.dart';
import 'package:primeiro_desafio/components/task.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool opacity = true;
  IconData icon = Icons.remove_red_eye_outlined;
  bool eyeOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'Tarefas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                opacity = !opacity;
                icon = eyeOpen ? Icons.remove_red_eye : Icons.remove_red_eye_outlined;
                eyeOpen = !eyeOpen;
              });
            },
            icon: Icon(icon),
          ),
        ],
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: ListView(
          children: const [
            Task(
              'Aprender Flutter',
              image: 'estudar.png',
              difficulty: 5,
            ),
            Task(
              'Aprender Python',
              image: 'python.png',
              difficulty: 1,
            ),
            Task(
              'Fazer bolo',
              image: 'bolo.jpeg',
              difficulty: 2,
            ),
            Task(
              'Meditar',
              image: 'meditar.jpeg',
              difficulty: 3,
            ),
            Task(
              'Ler',
              image: 'ler.jpeg',
              difficulty: 2,
            ),
            Task(
              'Jogar',
              image: 'jogar.jpeg',
              difficulty: 1,
            ),
          ],
        ),
      ),
    );
  }
}
