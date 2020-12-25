import 'package:flutter/material.dart';

class CommunityCateCard extends StatelessWidget {
  final String _category;
  final IconData _icon;
  final MaterialColor _color;
  const CommunityCateCard(this._category, this._icon, this._color);

  @override
  Widget build(BuildContext context) {
    String text;
    switch (_category) {
      case "content":
        text = "مُحتوى";
        break;
      case "qna":
        text = "سؤال جواب";
        break;
      case "geusthouse":
        text = "بيت الضيافة";
        break;
      case "explore":
        text = "أستكشاف";
        break;
      default:
    }

    return Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/img/community/$_category.png"), //??
                //image: NetworkImage("https://via.placeholder.com/300"),
                fit: BoxFit.contain,
                // colorFilter: ColorFilter.mode(
                //   Colors.black.withOpacity(0.04),
                //   BlendMode.srcOver,
                // ),
              ),
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black,
              //       offset: Offset(1, 1),
              //       blurRadius: 10,
              //       spreadRadius: -2)
              // ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      // color: Colors.black12,
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        text,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Comfortaa",
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            shadows: [
                              Shadow(
                                color: _color,
                                offset: Offset(0, 1),
                                blurRadius: 0,
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
              child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: _color,
              onTap: () {},
            ),
          )),
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: RadialGradient(colors: [
          //       _color[200].withAlpha(100),
          //       _color[300].withAlpha(100)
          //     ]),
          //  ),
          //)
        ],
      ),
    );
  }
}
