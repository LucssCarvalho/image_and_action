import 'package:flutter/material.dart';

class PageGame extends StatelessWidget {
  String type;
  PageGame(this.type);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(
          type,
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text(
                'JOGAR',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
