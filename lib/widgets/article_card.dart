import 'package:dinkum_app/screens/article_screen.dart';
import 'package:dinkum_app/shared/constants.dart';
import 'package:dinkum_app/widgets/category_chip.dart';

import '../models/article.dart';
import "package:flutter/material.dart";

class ArticleCard extends StatefulWidget {
  Article article;
  ArticleCard(this.article);
  @override
  _ArticleCardState createState() => _ArticleCardState();
}

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
                        widget.article.title,
                        style: Theme.of(context).textTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      if (widget.article.featuredImg != null)
                        Container(
                            height: 200,
                            width: double.infinity,
                            child: Image.network(
                              widget.article.featuredImg,
                              fit: BoxFit.cover,
                            )),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        widget.article.content,
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ArticleScreen(widget.article)));
                  },
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
                          vote(widget.article.id, true);
                        }),
                    Text(widget.article.votes.toString()),
                    IconButton(
                        icon: Icon(Icons.arrow_circle_down),
                        onPressed: () {
                          vote(widget.article.id, false);
                        }),
                  ],
                ),
              ),
              CategoryChip(
                text: widget.article.categories[0],
                color: article_ccolors[widget.article.categories[0]],
                callBack: () {}, //TODO article card open category
              ),
              IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    //TODO share a article function
                  }),
              PopupMenuButton(
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text("التعليقات"),
                    value: "comments",
                  ),
                  PopupMenuItem(
                    child: Text(
                        "إلغاء متابعة تصنيف ${widget.article.categories[0]}"),
                    value: "categoryUnsub",
                  ),
                  PopupMenuItem(
                    child: Text("إلغاء متابعة الكاتب"),
                    value: "authorUnsub",
                  ),
                  PopupMenuItem(
                    child: Text("إبلاغ عن محتوى مُسيء"),
                    value: "report",
                  ),
                ],
                tooltip: "مزيد من الخيارات",
                onSelected: (selected) {
                  switch (selected) {
                    case "comments":
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ArticleScreen(widget.article)));
                      break;
                    default:
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
