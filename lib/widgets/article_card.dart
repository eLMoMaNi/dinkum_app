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
                        Image.network(widget.article.featuredImg),
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
