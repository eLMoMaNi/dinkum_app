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
  //
  //
  [
    Swap(
      title: "كرة القدم ذات القواعد الأسترالية",
      subtitle:
          "التي تشبه نوع كرة القدم الذي كان منتشرا في خمسينيات القرن الماضي، لا تختلف كثيرا عن قواعد الرجبي وقواعد الاتحاد باستثناء الانتقال من الملاعب المستطيلة إلى الملاعب البيضاوية الشكل وهذا تطلب القيام بمهام أكثر في الملعب. تغير اسم كرة القدم ذات القواعد الفيكتورية إلى كرة القدم ذات القواعد الأسترالية، رغم أن الناس من نيوساوث ويلز وكوينزلاند يرفضون هذه التسمية تماما.",
      imgUrl:
          "https://www.frankgordon.com.au/wp-content/uploads/2020/03/AFL-scaled.jpg",
      type: SwapCardType.Image,
      isRoot: true,
    ),
    Swap(
      title: "كرة القدم الأمريكية",
      subtitle:
          "الغرض في اللعبة هو تخطي لاعبي الفريق الخصم والوصول إلى نهاية منطقة الخصم. يمكن حمل الكرة باليدين والتقدم بها أو رميها (تمريرها) إلى لاعب آخر في منطقة أخرى لمواصلة التقدم. ويمكن أيضاً أخذ الكرة من يد اللاعب في نفس الفريق مباشرة. يمكن تحقيق هدف بأكثر من طريقة: التقدم وتخطي خط الهدف في منطقة الخصم دون توقف، أو رمي الكرة للاعب آخر موجود بعد خط الهدف وهكذا يحصل الفريق على ست نقاط وبعدها يحاول الفريق المهاجم إحراز نقطة أو نقطتين، أو ركل الكرة عالياً بين العمودين الموجودين أعلى نهاية منطقة الفريق الآخر وبهذا يحصل الفريق على ثلاث نقاط. الفريق الفائز هو الذي يحصد أكبر قدر من النقاط في الوقت المحدد.",
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/a/af/College_Football.jpg",
      type: SwapCardType.Image,
      isRoot: false,
    ),
    Swap(
      title: "هوكي الجليد",
      subtitle:
          "رياضة يتبارى فيها فريقان على مساحة محددة من الجليد. تحظى هوكي الجليد بشعبية عالية في كندا، بالاضافة الى روسيا، والسويد، وفنلندا، يضع اللاعبون زلاجات على أقدامهم لكي يتمكنوا من الحركة بسرعة كبيرة جداً. يتكون كل فريق من 6 لاعبيين، يحمل اللاعبون عصي الهوكي لدفع أو تمرير القرص (Puck) على الجليد. يحرز الفريق نقطة حين يدخل القرص في المرمى، حيث يحاول حارس الفريق الخصم ألا يسمح لهم بذلك.",
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Capitals-Maple_Leafs_%2834075134291%29.jpg/1920px-Capitals-Maple_Leafs_%2834075134291%29.jpg",
      type: SwapCardType.Image,
      isRoot: false,
    ),
    Swap(
      title: "سباق الهجن أو الهجانة،",
      subtitle:
          "رياضة عربية أصيلة. مشهورة في الشرق الأوسط بين العرب وخاصة في منطقة الجزيرة العربية، وكذلك في أفريقيا وأستراليا. والهجن نوع من الإبل، تستخدم للرياضة والركوب، تتسابق الهجن في هذه الرياضة بسرعة تصل إلى 64 كم/س في مضامير مخصصة لهذا السباق. تشبه هذه الرياضة إلى حد كبير سباق الخيل، إلا أن الاختلاف بين سباق الهجن وسباق الخيول هو الركبي الالي الذي يوضع على الجمل أو الهجن بينما في الخيول يركبه فارس قد يخسر الكثير من وزنه مقابل الحفاظ على لياقته لكي يتحملة الحصان في السباق بنما في سباقات الهجن يستخدم الرجل الالي الذي يصل وزنه 2 أو 3 كيلو جرامات فقط.",
      imgUrl:
          "https://www.elmawke3.com/wp-content/uploads/2015/08/%D8%B3%D8%A8%D8%A7%D9%82-%D8%A7%D9%84%D9%87%D8%AC%D9%86-%D9%81%D9%89-%D8%B9%D9%85%D8%A7%D9%86.jpg",
      type: SwapCardType.Image,
      isRoot: false,
    ),
  ],
  //
  //
  [
    Swap(
      title: "بورت آرثر",
      subtitle:
          'هي مُلكية تراثية عالمية تتكون من 11 موقعًا متبقيًا، تم بناؤه في الأصل داخل الإمبراطورية البريطانية خلال القرنين الثامن عشر والتاسع عشر على شرائط ساحلية أسترالية خصبة. وصفت اليونسكو هذه المواقع ، بما في ذلك بورت آرثر ، بأنها "... أفضل الأمثلة الباقية على نقل المدانين على نطاق واسع والتوسع الاستعماري للقوى الأوروبية من خلال وجود وعمل المدانين."',
      imgUrl:
          "https://www.tassietrade.com.au/__data/assets/image/0005/67964/port-arthur.jpg?",
      type: SwapCardType.Image,
      isRoot: true,
    ),
    Swap(
      title: "البتراء",
      subtitle:
          'مدينة أثرية وتاريخية تقع في محافظة معان في جنوب الأردن. تشتهر بعمارتها المنحوتة بالصخور ونظام قنوات جر المياه القديمة، كما سُميت بـ "المدينة الوردية" نسبةً لألوان صخورها الملتوية. أُسست البتراء تقريبًا في عام 312 ق.م كعاصمة لمملكة الأنباط. تم اختيارها كواحدة من عجائب الدنيا السبع الجديدة عام 2007.',
      imgUrl: "https://images.memphistours.com/large/184203755_Petra.jpg",
      type: SwapCardType.Image,
      isRoot: false,
    ),
    Swap(
      title: "أفسس أو إفسوس،",
      subtitle:
          "أفسس أو إفسوس، وهي من اعظم المٌدن الاغريقية القديمة في الأناضول، وتقع في منطقة ليديا (Lydia) – منطقة تاريخية في غرب الاناضول- عند نهر كيستر الذي يصب في بحر ايجة (في تركيا الحالية). أسست في القرن العاشر قبل الميلاد من الإغريق القدامى. ان بقايا مدينة افسس تٌعتبر أكبر مستقطب للسياح وخاصةَ السٌياح الذين يسافرون في السٌفن.",
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Ephesus_Celsus_Library_Fa%C3%A7ade.jpg/1280px-Ephesus_Celsus_Library_Fa%C3%A7ade.jpg",
      type: SwapCardType.Image,
      isRoot: false,
    ),
    Swap(
      title: "الكولوسيوم",
      subtitle:
          "هو مدرج روماني عملاق يقع في وسط مدينة روما، تم تشييده إلى شرق المنتدى الروماني، ويرجع تاريخ بنائه إلى عهد الإمبراطورية الرومانية في القرن الأول فيما بين عامي 70 و72 بعد الميلاد، وتم الانتهاء منه بشكل أساسي عام 80 في عهد تيتوس، تم بناء المدرج الأكبر في العالم من الخرسانة والحجارة، ويعد المدرج بمثابة العمل الأكبر الذي شيدته الإمبراطورية الرومانية، حيث يعتبر واحدًا من أعظم الأعمال المعمارية والهندسية الرومانية. وطُبعت صورة الكولوسيوم على قطعة الخمس سنتات من النسخة الإيطالية.",
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Colosseum_in_Rome%2C_Italy_-_April_2007.jpg/1920px-Colosseum_in_Rome%2C_Italy_-_April_2007.jpg?",
      type: SwapCardType.Image,
      isRoot: false,
    ),
  ],
  //
  //
  [
    Swap(
      title: "حلوى اللامينغتون",
      subtitle:
          " هي حلوى أسترالية تصنع عادةً من قطعٍ من الكعك الإسفنجي المغطى بطبقة خارجية من صلصة الشوكولاتة وجوز الهند المجفف. تمتص الكعكة الإسفنجية خليط الشوكولاتة الخفيف تم تُترك ليتخللها الخليط تماما وذلك هو سر قوام هذه الكعكة المميز. قد تختلف طريقة تحضير الكعكة من شخص إلى آخر، حيث يضيف البعض طبقة من الكريمة أو مربى الفراولة بين قطعتين من اللامينغتون.",
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/NZ_Lamington.jpg/1280px-NZ_Lamington.jpg",
      type: SwapCardType.Image,
      isRoot: true,
    ),
    Swap(
      title: "الكنافة",
      subtitle:
          "الكنافة هي حلوى فلسطينية عربية تتكون من خيوط عجين، يضاف إليها السمن والسكر والمكسرات. والكنافة تعدّ إحدى أشهر الحلويات في البلاد العربية بالاضافة الى تركيا والقوقاز واليونان وغيرها. فهي من الحَلَوِيَّات الدارجة في جميع الفصول والمواسم، فهي غَنِيَّة بكميات كبيرة من السكر والفيتامينات وتحتوي على كميّات كبيرة من البروتينات واليود والحديد والفسفور. كما تُقَدَّم الكنافة في جميع الحفلات والمناسبات.",
      imgUrl:
          "https://i2.wp.com/lalafaty.com/wp-content/uploads/2018/03/%D8%A7%D9%84%D8%A8%D8%A7%D8%B1%D8%B2%D8%A9-56.png",
      type: SwapCardType.Image,
      isRoot: false,
    ),
    Swap(
      title: "الكاستيلا",
      subtitle:
          "هو نوع من الكعك الاسفنجي ذو شعبية في اليابان مصنوعة من السكر، والدقيق، والبيض، والنشا، وهو شائع جدا في المقاهي والأماكن العامة ويباع في الطرقات أيضًا.",
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Castella%2Cmade_in_nagasaki-city%2Cjapan.JPG/1280px-Castella%2Cmade_in_nagasaki-city%2Cjapan.JPG",
      type: SwapCardType.Image,
      isRoot: false,
    ),
    Swap(
      title: "كيكة باتنبرغ",
      subtitle:
          "هي كيكة شطرنج مغلفة بعجينة اللوز الفاخرة وهي كيكة تقليدية بريطانية ملكية كانت تقدم في بلاط الملك الى جانب كوب من الشاي.",
      imgUrl: "https://akelcom.com/wp-content/uploads/2020/01/download-1.jpg?",
      type: SwapCardType.Image,
      isRoot: false,
    ),
  ],
];
/*
*/
