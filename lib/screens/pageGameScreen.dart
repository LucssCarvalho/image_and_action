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
  List<TeamModal> teams = [];

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

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
    print(teams);
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
                                  controller: nameController,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Para jogar é necessario pelo menos duas equipes',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
              teams == null || teams.isEmpty
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
                              itemCount: teams.length,
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
                                            teams[index],
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            teams[index].teamName,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                              'Pontos: ${teams[index].ponts.toString()}')
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
              teams.length >= 2
                  ? Column(children: <Widget>[
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
                                },
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            MaterialButton(
                              color: Colors.blueGrey[700],
                              child: Text(
                                'Opções',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ])
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
    TeamModal team = new TeamModal(nameController.text, 0, Colors.green);
    setState(() {
      teams.add(team);
      nameController.text = '';
    });
    print(teams);
  }
}
