import 'package:dinkum_app/models/swap.dart';
import 'package:dinkum_app/widgets/swap/swap_card.dart';
import 'package:dinkum_app/widgets/swap/swipe_box.dart';
import 'package:flutter/material.dart';

///This class combine multiple swap cards and puts them into a swipe box,
///
///it can also modifiy the behavior of the swipe box
class SwapBox extends StatefulWidget {
  final List<Swap> children;
  final Function onSwipeRight;
  final Color color;
  SwapBox(
      {@required this.children,
      @required this.onSwipeRight,
      this.color = Colors.indigo});

  @override
  _SwapBoxState createState() => _SwapBoxState();
}

class _SwapBoxState extends State<SwapBox> {
  @override
  Widget build(BuildContext context) {
    return SwipeBox(
      children: widget.children.map((e) => SwapCard(e)).toList(),
      onSwipeRight: widget.onSwipeRight,
      color: widget.color,
    );
  }
}
