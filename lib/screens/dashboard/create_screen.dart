import 'package:dinkum_app/screens/create_article_screen.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              _createPlatformsCards(Icons.article_outlined, Colors.blue, () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => CreateArticleScreen()));
              }, "مقالات",
                  "تستطيع من خلال هذه المنصه تقديم محتوى عربي عن أستراليا. تستيطع ان تصنع محتوىً مُنسق و إضافة الصور. هذه المنصه مخصصه لتقديم المحتوى فقط وليس التواصل او تبادل الافكار."),
              _createPlatformsCards(
                  Icons.swap_horiz,
                  Colors.indigo,
                  () {}, //TODO add create swap post screen
                  "تبادل",
                  "تستطيع هنا تبادل الافكار مع اعضاء دِنكوم من خلال اضافة فكرة تعرفها عن اُستراليا. او الرد على افكار قام بنشرها غيرك. يجب ان يكون الرد بفكرة مطابقه لنفس الفكرة ولكن من منظور مختلف من خارج أستراليا."),
              _createPlatformsCards(
                Icons.group,
                Colors.deepPurple,
                () {}, //TODO add create community post screen
                "مُجتمع",
                "هذا هو المكان المخصص لتواصل مُجتمع مُحبي أستراليا -دِنكوم-! تستيطع طرح الاسئله و مشاركة التجارب مع الاعضاء أو حتى العثور على مقيمي أستراليا لأستضافتك اثناء زيارتك لأستراليا.",
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget _createPlatformsCards(IconData icon, Color color, Function callBack,
    String title, String content) {
  return Container(
    //height: 150,
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Card(
      elevation: 20,
      color: color,
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Column(
                children: [
                  Icon(
                    icon,
                    size: 70,
                    color: Colors.white,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: InkWell(
                onTap: () {
                  callBack();
                },
              ),
            )
          ],
        ),
      ),
    ),
  );
}
