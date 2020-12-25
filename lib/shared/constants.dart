import 'package:dinkum_app/models/swap.dart';
import 'package:flutter/material.dart';

/// articles categories colors
const article_ccolors = {
  "تاريخ": Colors.orange,
  "سياحة": Colors.lightBlue,
  "ثقافة": Colors.amberAccent,
  "طبيعة": Colors.green,
  "علوم": Colors.indigo,
  "فن": Colors.tealAccent,
  "مجتمع": Colors.brown,
};

/// articles swap colors
const swap_ccolors = {};

/// articles community colors
const community_cate_colors = {};

//swap dummy data
List<List<Swap>> swapDummy = [
  [
    Swap(
      title: "حيوان البلاتيبوس الفريد الموجود فقط في أستراليا!",
      subtitle:
          "يعيش حيوان البلاتيبوس أو المُسمى منقار البط في الساحل الشرقي في استراليا و جزيرة تاسمانيا الأسترالية.ما يميز هذا الحيوان هو شكله الغريب المتنوع حيث أن لَه منقاراً كمنقار البط وذيل القَندسِ و مخالب ثعالب الماء، بل إن ذكورد البلاتيبوس تمتلك سماً قاتلاً في مخالبها. ",
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/a/a4/A_companion_to_Mr._Bullock%27s_London_Museum_and_Pantherion_-_containing_a_brief_description_of_upwards_of_fifteen_thousand_natural_and_foreign_curiosities%2C_antiquities%2C_and_productions_of_the_fine_%2820480842478%29.jpg",
      type: SwapCardType.Image,
      isRoot: true,
    ),
    Swap(
      title: "خلد الماء نجمي الأنف",
      subtitle:
          "هو خلد يعيش في المناطق الرطبه في شمال أمريكا مثل الساحل الشرقي لكُل من الولايات المتحدة الامريكية و كندا. يمتلك هذا الحيوان انفاً غريب الشكل، و يملك ما يسمى بأعضاء أيمر التي يستطيع من خلالها الاستشعار بدقه لدرجة أنهُ قد يكون مناسباً لإستشعار الزلازل!",
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/e/ef/Condylura.jpg",
      type: SwapCardType.Image,
      isRoot: false,
    ),
    Swap(
      title: "ببغاء الكاكابو",
      subtitle:
          "يعتبر ببغاء الكاكابو الببغاء الوحيد الذي لا يستطيع الطيران! موطنه الأصلي هو نيوزيلندا و قد تناقصت أعداده في القرون الماضية لعدة اسباب. ما يميز هذا الحيوان هو وزنه الثقيل و طول عُمره، كما أنه لا ينشط إلا في الليل حتى أن أسمهُ هو كلمة من لغة الماورية و تعني ببغاء الليل.",
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/a/aa/Sirocco_full_length_portrait.jpg",
      type: SwapCardType.Image,
      isRoot: false,
    ),
  ],
];
