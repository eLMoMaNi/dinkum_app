import 'package:dinkum_app/models/swap.dart';
import 'package:dinkum_app/widgets/swap/swipe_box.dart';
import 'package:flutter/material.dart';

class SwapCard extends StatefulWidget {
  Swap swap;
  SwapCard(this.swap);
  @override
  _SwapCardState createState() => _SwapCardState();
}

class _SwapCardState extends State<SwapCard> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.swap.title,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  //   textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_circle_up),
                      onPressed: () {
                        //
                      }),
                  Text(widget.swap.votes.toString()),
                  IconButton(
                      icon: Icon(Icons.arrow_circle_down),
                      onPressed: () {
                        //
                      }),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    if (widget.swap.imgUrl != null &&
                        widget.swap.type == SwapCardType.Image)
                      Container(
                          height: _isExpanded ? 300 : 100,
                          width: double.infinity,
                          child: Image.network(
                            widget.swap.imgUrl,
                            fit: BoxFit.contain,
                          )),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      widget.swap.subtitle,
                      style: Theme.of(context).textTheme.subtitle2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: _isExpanded ? 10 : 3,
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                  child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => setState(() => _isExpanded = !_isExpanded),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
