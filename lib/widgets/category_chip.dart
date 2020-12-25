import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;
  final bool hasBorder;
  CategoryChip(
      {@required this.text,
      @required this.color,
      @required this.onPressed,
      this.hasBorder = false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Chip(
        shape: StadiumBorder(
          side: hasBorder
              ? BorderSide(
                  width: 4,
                  color: Colors.white,
                )
              : BorderSide(color: Colors.transparent),
        ),
        elevation: 2,
        shadowColor: Colors.black,
        label: Container(
          width: 150,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ),
        backgroundColor: color,
      ),
    );
  }
}
