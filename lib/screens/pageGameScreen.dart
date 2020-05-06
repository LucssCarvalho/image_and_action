import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_and_action/screens/objectsList.dart';

class PageGameScreen extends StatefulWidget {
  final String type;

  PageGameScreen(this.type);

  @override
  _PageGameScreenState createState() => _PageGameScreenState(type);
}

class _PageGameScreenState extends State<PageGameScreen> {
  String type;

  _PageGameScreenState(this.type);

  List<String> list = new ObjectList().allList;

  String object;

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categoria: $type',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        actions: <Widget>[
          MaterialButton(
            color: Colors.redAccent,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                Text(
                  'Jogar',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            onPressed: () {
              if (type == 'TUDO') {
                random(list);
              } else {
                print('Nenhum tipo encontrado');
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.red[100],
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      object.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 50,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void random(List<String> list) {
    Random rnd = new Random();
    String valorAleatorio = list[rnd.nextInt(list.length)];

    setState(() {
      object = valorAleatorio;
    });
    print(object);
  }
}
