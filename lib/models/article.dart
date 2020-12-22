import "package:flutter/foundation.dart";

import 'profile.dart';
import 'cate.dart';

class Article {
  String title;
  String content;
  List<Cate> category;
  String featuredImg; //?.
  //server-side
  String id;
  Profile author;
  int upvotes;
  int downvotes;
  int votes;

  Article(
      {@required this.title,
      @required this.content,
      @required this.category,
      this.featuredImg,
      this.author,
      this.id,
      this.upvotes,
      this.downvotes,
      this.votes});
}
