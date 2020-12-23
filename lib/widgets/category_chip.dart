import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String text;
  final Color color;
  final Function callBack;
  CategoryChip({
    @required this.text,
    @required this.color,
    @required this.callBack,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callBack();
      },
      child: Chip(
        padding: EdgeInsets.symmetric(horizontal: 50),
        label: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).scaffoldBackgroundColor),
        ),
        backgroundColor: color,
      ),
    );
  }
}
