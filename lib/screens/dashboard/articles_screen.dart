import 'package:dinkum_app/models/article.dart';
import 'package:dinkum_app/services/firestore_service.dart';
import 'package:dinkum_app/shared/constants.dart';
import 'package:dinkum_app/widgets/category_chip.dart';
import 'package:flutter/material.dart';

import '../../widgets/article_card.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
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
              //  throw snapshot.error;
              print(snapshot.error);
              return Center(child: Text("Something went wrong"));
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data.length + 1,
                itemBuilder: (_, idx) {
                  if (idx == 0)
                    return Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                            (article_ccolors.entries.map((entry) => Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: vw > 500 ? 30 : 10),
                                  child: CategoryChip(
                                      text: entry.key,
                                      color: entry.value,
                                      callBack: () => setState(() {
                                            selectedCategories = [entry.key];
                                          })),
                                ))).toList(),
                      ),
                    );
                  return Container(
                    child: ArticleCard(snapshot.data[idx - 1]),
                    margin: EdgeInsets.symmetric(vertical: 10),
                  );
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
