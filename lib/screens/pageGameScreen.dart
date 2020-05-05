import 'dart:math';

import 'package:flutter/material.dart';

class PageGameScreen extends StatefulWidget {
  final String type;
  PageGameScreen(this.type);
  @override
  _PageGameScreenState createState() => _PageGameScreenState(type);
}

class _PageGameScreenState extends State<PageGameScreen> {
  final String type;
  _PageGameScreenState(this.type);

  @override
  Widget build(BuildContext context) {
    List list = ['mesa', 'cadeira', 'cama'];
    String object;

    void random(List list) {
      var rnd = new Random();
      var valorAleatorio = list[rnd.nextInt(list.length)];

      setState(() {
        object = valorAleatorio;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                random(list);
              })
        ],
        title: Text(type),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue[700],
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  object.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 60,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
