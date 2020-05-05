import 'package:flutter/material.dart';
import 'package:image_and_action/screens/pageGameScreen.dart';

class SelectGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[200],
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buttonTypeGame(context, 'TUDO'),
            buttonTypeGame(context, 'ANIMAIS'),
            buttonTypeGame(context, 'OBJETOS'),
            buttonTypeGame(context, 'VERBOS'),
          ],
        ),
      ),
    );
  }
}

Widget buttonTypeGame(context, String type) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: MaterialButton(
      child: Container(
        height: 70,
        color: Colors.white,
        alignment: Alignment.center,
        child: Text(type),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PageGameScreen(type),
          ),
        );
      },
    ),
  );
}
