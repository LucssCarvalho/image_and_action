import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_and_action/modals/team_modal.dart';
import 'package:image_and_action/screens/objectsList.dart';
import 'package:image_and_action/widgets/bottomSheet.dart';

class PageGameScreen extends StatefulWidget {
  final String type;

  PageGameScreen(this.type);

  @override
  _PageGameScreenState createState() => _PageGameScreenState(type);
}

class _PageGameScreenState extends State<PageGameScreen> {
  String type;

  _PageGameScreenState(this.type);

  List<String> list;

  String object;

  selectListType(type) {
    if (type == 'TUDO') {
      setState(() {
        list = new ObjectList().allList;
      });
    } else if (type == 'ANIMAIS') {
      setState(() {
        list = new ObjectList().listAnimais;
      });
    } else if (type == 'OBJETOS') {
      setState(() {
        list = new ObjectList().listObjetos;
      });
    } else if (type == 'VERBOS') {
      setState(() {
        list = new ObjectList().listVerbos;
      });
    }
  }

  initState() {
    super.initState();
    selectListType(type);
    random(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'Categoria: $type',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                alignment: Alignment.center,
                child: MaterialButton(
                  color: Colors.blueGrey[800],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.replay,
                          color: Colors.white,
                        ),
                        Text(
                          'TROCAR PALAVRA',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    random(list);
                  },
                ),
              ),
              Container(
                height: 250,
                width: 450,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/quadro.png'),
                      fit: BoxFit.fill),
                ),
                child: Text(
                  object,
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
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
