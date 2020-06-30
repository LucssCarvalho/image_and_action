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
  List<TeamModal> _teams = [];
  bool inGame = false;
  bool _wordVisible = true;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

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
    print(_teams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0))),
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 40.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.grey[100]),
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 5,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'Criar equipe',
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 25),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _nameController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Nome da equipe',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) =>
                                      value.isEmpty ? 'nome inválido' : null,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RaisedButton(
                                      color: Colors.blueGrey,
                                      onPressed: () {
                                        _validate();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 150,
                                        child: Text(
                                          "CRIAR",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                      shape: StadiumBorder(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Criar Equipe',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
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
          child: Column(
            children: <Widget>[
              _teams.length >= 2
                  ? Row()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Para jogar é necessario pelo menos duas equipes',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
              _teams == null || _teams.isEmpty
                  ? Container(
                      color: Colors.blueGrey,
                      child: Row(),
                    )
                  : Container(
                      color: Colors.white,
                      height: 60,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _teams.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(25.0),
                                          ),
                                        ),
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return DetailBottomSheet(
                                            _teams[index],
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            _teams[index].teamName,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                              'Pontos: ${_teams[index].ponts.toString()}')
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
              _teams.length >= 2
                  ? Column(
                      children: <Widget>[
                        Container(
                          height: 250,
                          width: 450,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/quadro.png'),
                                fit: BoxFit.fill),
                          ),
                          child: object != null
                              ? Text(
                                  object.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 50,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                )
                              : MaterialButton(
                                  color: Colors.blueGrey[800],
                                  child: Text(
                                    'Jogar',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  onPressed: () {
                                    random(list);
                                    inGame = true;
                                  },
                                ),
                        ),
                        inGame
                            ? Container(
                                color: Colors.blue[900],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    MaterialButton(
                                      color: Colors.blue,
                                      onPressed: () {},
                                      child: Container(
                                          child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.visibility_off,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            ' Esconder',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      )),
                                    ),
                                    MaterialButton(
                                      color: Colors.blue,
                                      onPressed: () {
                                        random(list);
                                      },
                                      child: Container(
                                          child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.refresh,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            ' Trocar',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ],
                                ),
                              )
                            : Row(),
                        inGame
                            ? Container(
                                color: Colors.blueGrey[900],
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Faça a mímica para continuar o jogo',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: MaterialButton(
                                              child: Text('Iniciar contador'),
                                              color: Colors.white,
                                              onPressed: () {},
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: MaterialButton(
                                              child: Text('Pausar contador'),
                                              color: Colors.white,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 50.0,
                                            right: 50.0,
                                            bottom: 10.0,
                                            top: 10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.access_alarm,
                                                  color: Colors.grey,
                                                  size: 30,
                                                ),
                                                Text(
                                                  'Cronômetro',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  ': 1:00',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Row(),
                      ],
                    )
                  : Row(
                      children: <Widget>[],
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

  void _validate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _submit();
      Navigator.pop(context);
    }
    // teams.add(new TeamModal('lucsd', 0));
  }

  void _submit() {
    TeamModal team = new TeamModal(_nameController.text, 0, Colors.green);
    setState(() {
      _teams.add(team);
      _nameController.text = '';
    });
    print(_teams);
  }
}
