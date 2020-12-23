import 'package:dinkum_app/models/article.dart';
import 'package:dinkum_app/services/firestore_service.dart';
import 'package:flutter/material.dart';

import '../../widgets/article_card.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Article>>(
        future: FirestoreService().getArticles([]),
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, idx) => Container(
                child: ArticleCard(snapshot.data[idx]),
                margin: EdgeInsets.symmetric(vertical: 10),
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
