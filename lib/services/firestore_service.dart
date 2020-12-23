import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinkum_app/models/article.dart';
import 'package:flutter/material.dart';

/// This service class is a warper to Firebase Firestore APIs.
///
/// used to Read/Write/Update/Delete the database
class FirestoreService {
  FirebaseFirestore _ffi = FirebaseFirestore.instance;

  Future<QuerySnapshot> _getCollection(
    String collName,
    List<String> categories,
  ) async {
    try {
      if (categories == null || categories.isEmpty) {
        return await _ffi.collection(collName).get();
      } else
        return await _ffi
            .collection(collName)
            .where("categories", arrayContainsAny: categories)
            .get();
    } catch (e) {
      print("Error when getting collection =>\n$e");
    }
  }

  Future<List<Article>> getArticles(List<String> categories) async {
    QuerySnapshot coll = await _getCollection("articles", categories);
    print("coll = ${coll.docs}");
    if (coll.docs.isEmpty) return [];
    return coll.docs.map((e) => Article.fromSnapshot(e)).toList();
  }

  Future<QuerySnapshot> getSwapPosts(List<String> categories) =>
      _getCollection("swap", categories);
  Future<QuerySnapshot> getCommunityPosts(List<String> categories) =>
      _getCollection("community", categories);
}
