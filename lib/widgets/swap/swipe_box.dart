import 'dart:math';

import 'package:flutter/material.dart';

class SwipeBox extends StatefulWidget {
  //TODO add comments to this code and make it generic
  final List<Widget> children;
  final Function onSwipeRight;
  final Color color;
  SwipeBox({
    @required this.children,
    this.onSwipeRight,
    this.color = Colors.blue,
  });

  @override
  _SwipeBoxState createState() => _SwipeBoxState();
}

class _SwipeBoxState extends State<SwipeBox> {
  int _currentDeg = 0;
  bool _needFix = false;
  int get _currentIdx {
    if (_currentDeg <= 0) return 0;
    return (_currentDeg / 180.0).round();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (val) {
        setState(() {
          print("CurrentDeg================${_currentDeg % 360}");

          if (_currentDeg % 180 >= 60 && _currentDeg % 180 <= 120) {
            //move faster between 90'
            _currentDeg += -val.delta.dx.toInt() * 7;
          } else
            _currentDeg += -val.delta.dx.toInt();

          if (_currentDeg >= (widget.children.length - 1) * 180)
            //max index boundry
            _currentDeg = (widget.children.length - 1) * 180;
          else if (_currentDeg <= -60) _currentDeg = -60; //min index boundry

          //fixs mirror effect on 90'
          _needFix = (_currentDeg / 180).round() % 2 == 1; //
        });
      },
      onHorizontalDragEnd: (_) => setState(() {
        if (_currentDeg < 0) {
          //users swipe right on zero index
          if (_currentDeg <= -50)
            //call function if reached threshold
            widget.onSwipeRight();

          // go back to home place
          _currentDeg = 0;
        } else if ((_currentDeg % 180) <= 90) {
          //if degree is less than 90'
          //go back
          _currentDeg -= (_currentDeg % 90);
        } else {
          //degree >90' so go forward
          _currentDeg = 90 * (_currentDeg / 90).ceil();
        }

        //no need for this check but I WILL KEEP IT
        _needFix = (_currentDeg / 180) % 2 == 1;
      }),
      child: _currentDeg < 0
          ? // put stack on swap right
          _currentDeg < -50
              //max threshold is -50
              ? buildSwipeStack(-50)
              : buildSwipeStack(_currentDeg)
          //3d transform
          : buildTransformY(
              _currentDeg,
              //this transform do the swipe effect
              buildTransformY(
                _needFix ? 180 : 0,
                //this transform fixs the mirror effect
                widget.children[_currentIdx],
              ),
            ),
    );
  }

  Stack buildSwipeStack(int xOffset) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: widget.color,
            //   width: double.infinity,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Icon(
                    Icons.swap_horiz,
                    size: 50,
                  ),
                  Text(
                    "تبديل",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(xOffset * -1.0, 0),
          child: widget.children[0],
        )
      ],
    );
  }

  Transform buildTransformY(int degree, Widget child) {
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(degree * pi / 180.0),
        child: child);
  }
}
