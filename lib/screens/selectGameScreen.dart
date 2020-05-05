import 'package:flutter/material.dart';
import 'package:image_and_action/screens/pageGameScreen.dart';

class SelectGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buttonTypeGame(context, 'TUDO', '♾️'),
            buttonTypeGame(context, 'ANIMAIS', '🦁'),
            buttonTypeGame(context, 'OBJETOS', '🎳'),
            buttonTypeGame(context, 'VERBOS', '💃🏼'),
          ],
        ),
      ),
    );
  }
}

Widget buttonTypeGame(context, String type, String emoji) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: MaterialButton(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.red[800],
            borderRadius: BorderRadius.circular(15),
          ),
          height: 70,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                type,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                emoji,
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ],
          )),
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
