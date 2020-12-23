import 'package:dinkum_app/models/article.dart';
import 'package:dinkum_app/shared/constants.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  ArticleScreen(this.article);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: article_ccolors[article.categories[0]],
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                article.featuredImg,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              article.content,
              style: TextStyle(
                fontFamily: "Comfortaa",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
