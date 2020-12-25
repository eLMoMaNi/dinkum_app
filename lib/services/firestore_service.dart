import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinkum_app/models/article.dart';
import 'package:dinkum_app/services/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// This service class is a warper to Firebase Firestore APIs.
///
/// used to Read/Write/Update/Delete the database
class FirestoreService {
  FirebaseFirestore _ffi = FirebaseFirestore.instance;
  FirebaseStorage _fsi = FirebaseStorage.instance;

  Future<QuerySnapshot> _getCollectionQuery(
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
    QuerySnapshot coll = await _getCollectionQuery("articles", categories);
    print("coll = ${coll.docs}");
    print(coll.docs[1].data());
    if (coll.docs.isEmpty) return [];
    return coll.docs.map((e) => Article.fromSnapshot(e)).toList();
  }

  Future<String> postArticle(
    File imgFile,
    String categories,
    String title,
    String content,
  ) async {
    DateTime time = DateTime.now();
    String userUid = AuthService().userId;

    try {
      // uploading image to firestore
      await _fsi.ref("images/$userUid/$time").putFile(imgFile);
      // getting image public url
      String imgUrl = await _fsi.ref("images/$userUid/$time").getDownloadURL();

      //posting the article
      CollectionReference articlesColl = _ffi.collection("articles");
      await articlesColl.add({
        "author_id": userUid,
        "featured_img": imgUrl,
        "categories": [categories],
        "title": title,
        "content": content
      });
      return null;
    } catch (e) {
      return e.toString();
    }

    /*StorageReference storageReference = FirebaseStorage.instance
      .ref()
      .child('sightings/${Path.basename(_image.path)}');
  StorageUploadTask uploadTask = storageReference.putFile(_image);
  await uploadTask.onComplete;
  print('File Uploaded');
  String returnURL;
  await storageReference.getDownloadURL().then((fileURL) {
    returnURL =  fileURL;
  });
  return returnURL;*/
  }

  Future<QuerySnapshot> getSwapPosts(List<String> categories) =>
      _getCollectionQuery("swap", categories);
  Future<QuerySnapshot> getCommunityPosts(List<String> categories) =>
      _getCollectionQuery("community", categories);
}
