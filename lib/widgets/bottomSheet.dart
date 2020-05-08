import 'package:flutter/material.dart';
import 'package:image_and_action/screens/pageGameScreen.dart';

class CreateTeam extends StatefulWidget {
  @override
  _CreateTeamState createState() => _CreateTeamState();
}

enum Status { vermelho, azul, rosa, verde, amarelo }

class _CreateTeamState extends State<CreateTeam> {
  Status _colors = Status.azul;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.grey[100]),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
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
                          borderRadius: BorderRadius.all(Radius.circular(30))),
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
                      style: TextStyle(color: Colors.green, fontSize: 25),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
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
                  validator: (text) {
                    if (text.isEmpty) return "digite o nome do pokemon";
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Cor da equipe',
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          height: 30,
                          width: 30,
                        ),
                        Radio(
                          value: Status.azul,
                          groupValue: _colors,
                          onChanged: (Status value) {
                            setState(() {
                              _colors = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          height: 30,
                          width: 30,
                        ),
                        Radio(
                          value: Status.vermelho,
                          groupValue: _colors,
                          onChanged: (Status value) {
                            setState(() {
                              _colors = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(10)),
                          height: 30,
                          width: 30,
                        ),
                        Radio(
                          value: Status.rosa,
                          groupValue: _colors,
                          onChanged: (Status value) {
                            setState(() {
                              _colors = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          height: 30,
                          width: 30,
                        ),
                        Radio(
                          value: Status.verde,
                          groupValue: _colors,
                          onChanged: (Status value) {
                            setState(() {
                              _colors = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                          height: 30,
                          width: 30,
                        ),
                        Radio(
                          value: Status.amarelo,
                          groupValue: _colors,
                          onChanged: (Status value) {
                            setState(() {
                              _colors = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.lightGreen,
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        child: Text(
                          "CRIAR",
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
    );
  }
}
