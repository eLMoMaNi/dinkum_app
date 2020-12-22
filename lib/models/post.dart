import "package:flutter/foundation.dart";

import './user.dart';
import "./cate.dart";

class Article {
  String title;
  String content;
  List<Cate> category;
  String featuredImg; //?.
  //server-side
  String link;
  User user;
  int upvotes;
  int downvotes;
  int votes;

  Article(
      {@required this.title,
      @required this.content,
      @required this.category,
      this.featuredImg,
      this.user,
      this.link,
      this.upvotes,
      this.downvotes,
      this.votes});
}
