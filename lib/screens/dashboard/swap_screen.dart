import 'package:dinkum_app/models/article.dart';
import 'package:dinkum_app/services/firestore_service.dart';
import 'package:dinkum_app/shared/constants.dart';
import 'package:dinkum_app/widgets/category_chip.dart';
import 'package:dinkum_app/widgets/swap/swipe_box.dart';
import 'package:flutter/material.dart';

import '../../widgets/article_card.dart';

class SwapScreen extends StatefulWidget {
  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  List<String> selectedCategories = [];
  @override
  Widget build(BuildContext context) {
    var vw = MediaQuery.of(context).size.width;
    var vh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder<List<Article>>(
          future: FirestoreService().getArticles(selectedCategories),
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text("Something went wrong"));
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                width: double.infinity,
                height: 400,
                child: SwipeBox(
                  children: (snapshot.data.map((e) => ArticleCard(e))).toList(),
                  onSwipeRight: () {},
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
