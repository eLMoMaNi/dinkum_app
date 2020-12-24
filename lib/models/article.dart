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
    title = data["title"] ?? "No Title Error";
    content = data["content"] ?? "No Content Error";
    categories = List.from(data["categories"] ?? []);
    featuredImg = data["featured_img"] ?? "https://via.placeholder.com/300";
    authorId = data["author_id"] ?? "unknown";
    id = snapshot.id ?? "";
    upvotes = data["upvotes"] ?? 0;
    downvotes = data["downvotes"] ?? 0;
    votes = upvotes - downvotes; //??
  }
}
