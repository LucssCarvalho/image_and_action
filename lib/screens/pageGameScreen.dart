import 'dart:math';

import 'package:flutter/material.dart';
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
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Crie as equipes para jogar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.person_add),
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0))),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  margin: const EdgeInsets.only(top: 40.0),
                                  child: CreateTeam(),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Container(
              //   height: 250,
              //   width: 450,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('assets/images/quadro.png'),
              //         fit: BoxFit.fill),
              //   ),
              //   child: object != null
              //       ? Text(
              //           object.toString(),
              //           style: TextStyle(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 50,
              //               color: Colors.white),
              //           textAlign: TextAlign.center,
              //         )
              //       : MaterialButton(
              //           color: Colors.green[800],
              //           child: Text(
              //             'Jogar',
              //             style:
              //                 TextStyle(color: Colors.white, fontSize: 18),
              //           ),
              //           onPressed: () {
              //             random(list);
              //           },
              //         ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 20.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: <Widget>[
              //       MaterialButton(
              //         color: Colors.green[700],
              //         child: Text(
              //           'Opções',
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         onPressed: () {},
              //       ),
              //     ],
              //   ),
              // ),
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
