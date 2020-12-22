import 'package:dinkum_app/models/cate.dart';

import '../models/post.dart';
import "package:flutter/material.dart";

class ArticleCard extends StatefulWidget {
  Article post;
  @override
  _ArticleCardState createState() => _ArticleCardState();
}

Article post = Article(
  title:
      "عنوان تجريبي عنوان تجريبي عنوان تجريبي عنوان تجريبي عنوان تجريبي عنوان تجريبي عنوان تجريبي ",
  category: [Cate.Art],
  content:
      "هذا نص تجريبي وضع لمعاينة شكل النص العربي في مقالة البرنامج الافتارضيه الاكترونيه المرئيه الضوئيه المنسية هذا نص تجريبي وضع لمعاينة شكل النص العربي في مقالة البرنامج الافتارضيه الاكترونيه المرئيه الضوئيه المنسية هذا نص تجريبي وضع لمعاينة شكل النص العربي في مقالة البرنامج الافتارضيه الاكترونيه المرئيه الضوئيه المنسية ",
  featuredImg: "https://via.placeholder.com/800x600",
);

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Image.network(post.featuredImg),
                Text(
                  post.content,
                  style: Theme.of(context).textTheme.subtitle2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
            child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
          ),
        ))
      ],
    );
  }
}
