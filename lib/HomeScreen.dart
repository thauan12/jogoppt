import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int userChoice = 0;
  int robotChoice = 0;
  String result = '';
  String escolharobo = '';

  void _selectOption(int option) {
    setState(() {
      userChoice = option;
    });
    _playGame();
  }

  void _playGame() {
    final random = Random();
    robotChoice = random.nextInt(3) + 1;
    if (userChoice == null) {
      return;
    }
    if (userChoice == robotChoice) {
      setState(() {
        result = 'Empate!';
      });
    } else if ((userChoice == 1 && robotChoice == 3) ||
        (userChoice == 2 && robotChoice == 1) ||
        (userChoice == 3 && robotChoice == 2)) {
      setState(() {
        result = 'Você perdeu!';
      });
    } else {
      setState(() {
        result = 'Você ganhou!';
      });
    }
    if (robotChoice == 1){
      setState(() {
        escolharobo = 'assets/image/papel.png';
      });
    } else if (robotChoice == 2) {
      setState(() {
        escolharobo = 'assets/image/pedra.png';
      });
    } else if (robotChoice == 3) {
      setState(() {
        escolharobo = 'assets/image/tesoura.png';
      });
    } else {
      setState(() {
        escolharobo = 'assets/image/jogo.png';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pedra, Papel ou Tesoura',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(16.0)),
            Text(
              'Ganhe de mim se for capaz!',
              style: TextStyle(fontSize: 25),
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            Text(
              'Escolha do robo',
              style: TextStyle(fontSize: 20),
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            Image.asset(escolharobo, width: 150,
                          ),
            Padding(padding: EdgeInsets.all(16.0)),
            Text(
              'Faça sua escolha',
              style: TextStyle(fontSize: 25),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            Center(
              child: Row(
                children: [
                  Container(
                    child: InkWell(
                      onTap: () => _selectOption(1),
                      child: Ink.image(
                        image: AssetImage("assets/image/papel.png"),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Container(
                    child: InkWell(
                      onTap: () => _selectOption(2),
                      child: Ink.image(
                        image: AssetImage("assets/image/pedra.png"),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Container(
                    child: InkWell(
                      onTap: () => _selectOption(3),
                      child: Ink.image(
                        image: AssetImage("assets/image/tesoura.png"),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            Text(
              result,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}