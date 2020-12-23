import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/foundation.dart";

import 'profile.dart';

class Article {
  String title;
  String content;
  List<String> categories;
  String featuredImg; //?.
  //server-side
  String id;
  String authorId;
  int upvotes;
  int downvotes;
  int votes;
  Profile get authorProfile {
    //TODO get profile by id
    //return profileById(authorId);
  }
  Article(
      {@required this.title,
      @required this.content,
      @required this.categories,
      this.featuredImg,
      this.authorId,
      this.id,
      this.upvotes,
      this.downvotes,
      this.votes});
  Article.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data();
    title = data["title"];
    content = data["content"];
    categories = List.from(data["categories"] ?? []);
    featuredImg = data["featured_img"];
    authorId = data["author_id"];
    id = snapshot.id;
    upvotes = data["upvotes"];
    downvotes = data["downvotes"];
    votes = upvotes - downvotes; //??
  }
}
