import 'package:flutter/material.dart';
import 'package:flutterapp/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: const [
          Task(
              'Aprender Flutter',
              'assets/images/dash.png',
              0),
          Task(
              'Andar de Bike',
              'assets/images/bike.webp',
              2),
          Task(
              'Meditar',
              'assets/images/meditar.jpeg',
              5),
          Task(
              'Ler',
              'assets/images/livro.jpg',
              5),
          Task(
              'Jogar',
              'assets/images/jogar.jpg',
              5),
          SizedBox(height: 100)
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        //print("teste");
      }),
    );
  }
}