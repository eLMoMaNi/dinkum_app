import 'package:flutter/material.dart';

class CreateArticleScreen extends StatefulWidget {
  @override
  _CreateArticleScreenState createState() => _CreateArticleScreenState();
}

class _CreateArticleScreenState extends State<CreateArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("إنشاء مقالة"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.red,
                margin: EdgeInsets.all(10),
              ),
            ],
          ),
        ));
  }
}
