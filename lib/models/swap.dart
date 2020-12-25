import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/foundation.dart";

import 'profile.dart';

enum SwapCardType { Image, Emoji, Short }

class Swap {
  String title;
  String subtitle;
  SwapCardType type;
  bool isRoot;
  int upvotes;
  int downvotes;
  int get votes {
    return upvotes - downvotes;
  }

  //
  String imgUrl;
  String emoji;

  Swap({
    @required this.title,
    @required this.subtitle,
    @required this.type,
    @required this.isRoot,
    this.upvotes = 0,
    this.downvotes = 0,
    this.imgUrl,
    this.emoji,
  });
  Swap.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data();
    title = data["title"] ?? "No Title Error";
    subtitle = data["subtitle"] ?? "No subtitle Error";
    type = data["type"] ?? "short";
    isRoot = data["isRoot"] ?? false;
    imgUrl = data["img"] ?? null;
    emoji = data["emoji"] ?? null;
    upvotes = data["upvotes"] ?? 0;
    downvotes = data["downvotes"] ?? 0;
  }
  Profile get authorProfile {
    //TODO get profile by id
    //return profileById(authorId);
  }
}
