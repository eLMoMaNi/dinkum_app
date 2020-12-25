import 'package:dinkum_app/models/swap.dart';
import 'package:dinkum_app/shared/constants.dart';
import 'package:dinkum_app/widgets/swap/swap_box.dart';
import 'package:dinkum_app/widgets/swap/swipe_box.dart';
import 'package:flutter/material.dart';

class SwapScreen extends StatefulWidget {
  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  List<List<Swap>> swaps = swapDummy;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => setState(() {}),
      child: ListView.builder(
        itemCount: swaps.length,
        itemBuilder: (_, idx) {
          return SwapBox(
            children: swaps[idx],
            onSwipeRight: () {
              //TODO make a function that handles swap reply
            },
          );
        },
      ),
    );
  }
}
