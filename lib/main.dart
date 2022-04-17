import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var profession = [["선생님","Profesor"], ["학셍","Estudiante"], ["의사", "Doctor"],
                    ["회사원", "Oficinista"], ["요리사", "Cocinero"], ["기자", "Reportero"],
                    ["가수", "Cantante"], ["군인", "Soldado"]];

  var activity = [["자다","Dormir"], ["공부하다", "Estudiar"], ["일하다", "Trabajar"],
                  ["운동하다", "Ejercitarse"], ["숙제를 하다", "Hacer tarea"], ["옷을 사다", "comprar ropa"],
                  ["영화를 보다", "Ver una película"], ["친구를 만나다", "Encontrarse con un amigo"],
                  ["태권도를 배우다", "Aprender taekwondo"], ["밥을 먹다", "Comer"],
                  ["커피를 마시다", "Beber café"], ["책을 읽다", "Leer un libro"]];

  var place = [["도서관","Biblioteca"], ["집", "Casa"], ["백화점", "Centro comercial"],
               ["시장", "Mercado"], ["공원", "Parque"], ["커피숍", "Cafetería"],
               ["극장", "Cine"], ["학교", "Escuela"], ["식당", "Restaurante"],
               ["화사", "Empresa"]];

  var _game = [["", ""],["", ""],["", ""]];
  var _game_profession = "";
  var _game_activity = "";
  var _game_place = "";

  void _startGame(){
    setState(() {
      if(_game.isNotEmpty){
        _game.clear();
      }
      
      _game.add(profession[Random().nextInt(profession.length)]);
      _game_profession = _game[0][0];
      _game.add(activity[Random().nextInt(activity.length)]);
      _game_activity = _game[1][0];
      _game.add(place[Random().nextInt(place.length)]);
      _game_place = _game[2][0];

    });
  }

  void _translateGame(){
    setState(() {
      _game_profession = _game[0][1];
      _game_activity = _game[1][1];
      _game_place = _game[2][1];
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _game_profession = _game[0][0];
          _game_activity = _game[1][0];
          _game_place = _game[2][0];
        });
      });
    }); 
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      backgroundColor: const Color.fromRGBO(236, 239, 241, 1.0),
      body: Center(

        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ready to draw: \n',
              style: (TextStyle(
                color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                fontSize: 32,
                )
              ),
            ),
            Text(
              "Profession: " + _game_profession + "\n",
              style: Theme.of(context).textTheme.headline4,
            ),            
            Text(
              "Activity: " +_game_activity + "\n",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "Place: " +_game_place + "\n",
              style: Theme.of(context).textTheme.headline4,
            ),
            IconButton(
              onPressed: _translateGame,
              icon: const Icon(Icons.translate),
              hoverColor: Colors.blue[200],
              highlightColor: Colors.white
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startGame,
        tooltip: 'Generate test',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}