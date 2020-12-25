import 'package:dinkum_app/models/article.dart';
import 'package:dinkum_app/shared/constants.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  ArticleScreen(this.article);
  @override
  Widget build(BuildContext context) {
    var vw = MediaQuery.of(context).size.width;
    var vh = MediaQuery.of(context).size.height;
    Color color = article_ccolors[article.categories[0]];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: color,
              leading: IconButton(
                  icon: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 1.0,
                        top: 2.0,
                        child: Icon(Icons.arrow_back, color: color),
                      ),
                      Icon(Icons.arrow_back, color: Colors.white),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              title: Text(
                article.title,
                style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 20,
                  //?  background: Paint()..color = Colors.blue,
                  shadows: [
                    Shadow(color: color, offset: Offset(2, 2), blurRadius: 0)
                  ],
                ),
              ),
              centerTitle: true,
              expandedHeight: .35 * vh,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  //titlePadding: EdgeInsets.only(bottom: 0),

                  collapseMode: CollapseMode.parallax,
                  background: Image.network(
                    article.featuredImg,
                    width: vw,
                    // height: vh,
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(article.content),
          ),
        ),
      ),
    );
  }
}
