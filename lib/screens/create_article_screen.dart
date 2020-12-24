import 'dart:io';

import 'package:dinkum_app/services/firestore_service.dart';
import 'package:dinkum_app/shared/constants.dart';
import 'package:dinkum_app/widgets/category_chip.dart';
import 'package:dinkum_app/widgets/show_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateArticleScreen extends StatefulWidget {
  @override
  _CreateArticleScreenState createState() => _CreateArticleScreenState();
}

class _CreateArticleScreenState extends State<CreateArticleScreen> {
  final _formKey = GlobalKey<FormState>();
  File _selectedImg;
  String _selectedCategories;
  String _selectedTitle;
  String _selectedContent;
  @override
  Widget build(BuildContext context) {
    var vw = MediaQuery.of(context).size.width;
    var pickImageButton = Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey,
          margin: EdgeInsets.only(bottom: 10),
          child: _selectedImg == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Colors.white,
                        size: 100,
                      ),
                      Text(
                        "اضافة غلاف للمقال",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              : Image.file(
                  _selectedImg,
                  fit: BoxFit.cover,
                ),
        ),
        Positioned.fill(
            child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              await ImagePicker()
                  .getImage(source: ImageSource.gallery, imageQuality: 50)
                  .then(
                    (value) => setState(() => _selectedImg = File(value.path)),
                  );
            },
          ),
        ))
      ],
    );
    var selectCategoriesChip = InkWell(
      onTap: () {
        buildCategoriesDialog(context, vw);
      },
      child: _selectedCategories == null
          ? Chip(
              label: Container(
                  width: 150,
                  child: Text(
                    "أختيار",
                    textAlign: TextAlign.center,
                  )))
          : CategoryChip(
              text: _selectedCategories,
              color: article_ccolors[_selectedCategories],
              callBack: () {
                buildCategoriesDialog(context, vw);
              }),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text("إنشاء مقالة"),
          actions: [
            FlatButton.icon(
              onPressed: () {
                if (_selectedCategories == null)
                  showErrorDialog(context, "يجب إختيار تصنيف واحد على الأقل");
                else if (_selectedImg == null)
                  showErrorDialog(context, "يجب عليك إختيار صورة غلاف للمقالة");
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text("جارِ النَشر"),
                      content: Container(
                        width: 100,
                        height: 150,
                        child: Center(
                          child: FutureBuilder<String>(
                            future: FirestoreService().postArticle(
                                _selectedImg,
                                _selectedCategories,
                                _selectedTitle,
                                _selectedContent),
                            builder: (ctx, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting)
                                return CircularProgressIndicator();
                              if (snapshot.hasError)
                                return Text(snapshot.error);
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                Future.delayed(Duration(seconds: 3))
                                    .then((value) {
                                  Navigator.of(ctx).pop();
                                  Future.delayed(Duration(microseconds: 200))
                                      .then((_) => Navigator.of(context).pop());
                                });
                                return Column(
                                  children: [
                                    Icon(
                                      Icons.done,
                                      color: Colors.green,
                                      size: 100,
                                    ),
                                    Text("تم نشر المقال بنجاح!")
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
              icon: Icon(Icons.send),
              label: Text("نشر"),
              textColor: Colors.white,
              splashColor: Colors.white,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              pickImageButton,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("التصنيف:", style: TextStyle(fontSize: 16)),
                          SizedBox(width: 30),
                          selectCategoriesChip,
                        ],
                      ),
                      //  SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "عنوان المقال",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        validator: (text) => text.length < 6
                            ? "يجب ان يتكون العنوان من 6 حروف على الاقل"
                            : null,
                        onSaved: (text) =>
                            setState(() => _selectedTitle = text),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLines: 20,
                        keyboardType: TextInputType.multiline,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            labelText: "محتوى المقال",
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText:
                                "سيتم توفير خاصية تنسيق النص و اضافة الصور بين النص لاحقا...."),
                        validator: (text) => text.length < 6
                            ? "يجب ان يتكون المحتوى من 6 حروف على الاقل"
                            : null,
                        onSaved: (text) =>
                            setState(() => _selectedContent = text),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future buildCategoriesDialog(BuildContext context, double vw) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Container(
          height: 150,
          width: vw,
          child: GridView.count(
            crossAxisCount: 1,
            mainAxisSpacing: 5,
            childAspectRatio: 10,
            padding: EdgeInsets.all(0),
            children: article_ccolors.entries
                .map(
                  (entry) => CategoryChip(
                    text: entry.key,
                    color: entry.value,
                    callBack: () {
                      setState(() => _selectedCategories = entry.key);
                      Navigator.of(context).pop();
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
