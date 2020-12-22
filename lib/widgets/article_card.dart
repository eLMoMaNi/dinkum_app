import 'package:dinkum_app/models/cate.dart';

import '../models/article.dart';
import "package:flutter/material.dart";

class ArticleCard extends StatefulWidget {
  Article article;
  @override
  _ArticleCardState createState() => _ArticleCardState();
}

Article article = Article(
    title:
        "عنوان تجريبي عنوان تجريبي عنوان تجريبي عنوان تجريبي عنوان تجريبي عنوان تجريبي عنوان تجريبي ",
    category: [Cate.Art],
    content:
        "هذا نص تجريبي وضع لمعاينة شكل النص العربي في مقالة البرنامج الافتارضيه الاكترونيه المرئيه الضوئيه المنسية هذا نص تجريبي وضع لمعاينة شكل النص العربي في مقالة البرنامج الافتارضيه الاكترونيه المرئيه الضوئيه المنسية هذا نص تجريبي وضع لمعاينة شكل النص العربي في مقالة البرنامج الافتارضيه الاكترونيه المرئيه الضوئيه المنسية ",
    featuredImg:
        "https://www.finalsitesupport.com/hc/article_attachments/360000650392/800x600.png",
    votes: 167);

class _ArticleCardState extends State<ArticleCard> {
  void vote(String articleId, bool upVote) {
    //TODO add up/downvote function
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Text(
                        article.title,
                        style: Theme.of(context).textTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      if (article.featuredImg != null)
                        Image.network(article.featuredImg),
                      Text(
                        article.content,
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
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_circle_up),
                        onPressed: () {
                          vote(article.id, true);
                        }),
                    Text(article.votes.toString()),
                    IconButton(
                        icon: Icon(Icons.arrow_circle_down),
                        onPressed: () {
                          vote(article.id, false);
                        }),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(Icons.insert_comment),
                  onPressed: () {
                    //TODO go to article (comments) function
                  }),
              IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    //TODO share a article function
                  }),
              IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    //TODO article card more options button
                  }),
            ],
          )
        ],
      ),
    );
  }
}
