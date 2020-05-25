import 'package:flutter/material.dart';
import 'package:image_and_action/modals/team_modal.dart';
import 'package:image_and_action/screens/pageGameScreen.dart';

class DetailBottomSheet extends StatefulWidget {
  final TeamModal teamModal;

  DetailBottomSheet(this.teamModal);

  @override
  _CreateTeamState createState() => _CreateTeamState();
}

class _CreateTeamState extends State<DetailBottomSheet> {
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
            color: Colors.grey[400]),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    widget.teamModal.teamName,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.remove,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Pontos: ${widget.teamModal.ponts}',
                    style: TextStyle(fontSize: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
