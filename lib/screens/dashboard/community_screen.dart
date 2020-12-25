import 'package:dinkum_app/widgets/community/commuinty_category_card.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Table(
          children: [
            TableRow(children: [
              _createCard("content", Colors.teal),
              _createCard("geusthouse", Colors.red),
            ]),
            TableRow(children: [
              _createCard("qna", Colors.orange),
              _createCard("explore", Colors.teal),
            ])
          ],
        ),
        Card(
          child: Container(
            height: 100,
            child: Center(
              child: Text("قريباً...."),
            ),
          ),
        ),
        Card(
          child: Container(
            height: 100,
            child: Center(
              child: Text("قريباً...."),
            ),
          ),
        ),
        Card(
          child: Container(
            height: 100,
            child: Center(
              child: Text("قريباً...."),
            ),
          ),
        ),
        Card(
          child: Container(
            height: 100,
            child: Center(
              child: Text("قريباً...."),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createCard(String category, MaterialColor color) {
    return Card(
      child: Container(
          height: 150,
          child: CommunityCateCard(category, Icons.ac_unit, color)),
    );
  }
}
