class DataModel {
  final String name;
  final String img;
  final int price;
  final int people;
  // final int stars;
  final String description;
  final String location;

  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    // required this.stars,
    required this.description,
    required this.location,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      img: json['img'],
      price: json['price'],
      people: json['people'],
      // stars: json['stars'],
      description: json['description'],
      location: json['location'],
    );
  }
}

class places {
  final String placename;
  final String placehint;
  final String placeimage;
  final String placedetials;
  final String placeprice;
  final int placestars;
  places(
      {required this.placehint,
      required this.placeimage,
      required this.placestars,
      required this.placedetials,
      required this.placeprice,
      required this.placename});
}

List<places> place = [
  places(
    placestars: 4,
      placename: 'الفيوم',
      placehint: 'مصر',
      placedetials: 'الفيوم، مدينة مصرية عاصمة محافظة الفيوم. تنقسم إلى حيين سكنيين تفصلهما ترعة بحر يوسف الذي ينتصف مدينة الفيوم وتضم عدد ست مراكز وهي: الفيوم. إبشواي إطسا. سنورس. طامية. يوسف الصديق',
      placeimage: 'img/licensed-image.jpg',
      placeprice: '\$500'),
        places(
      placename: 'الاسكدرنية',
      placehint: 'مصر',
      placestars: 4,

      placedetials: 'الإسْكَنْدَرِيَّة هي العاصمة الثانية لمصر وكانت عاصمتها قديمًا، وهي عاصمة محافظة الإسكندرية وأكبر مدنها، تقع على ساحل البحر الأبيض المتوسط بطول حوالي 55 كم شمال غرب دلتا النيل، على مساحة 2679 كم²، يحدها من الشمال البحر الأبيض المتوسط، ومن الجنوب بحيرة مريوط حتى الكيلو 71 على طريق القاهرة - الإسكندرية الصحراوي،',
      placeimage: 'img/download.jpg',
      placeprice: '\$500'),
        places(
      placename: 'جبل افرست',
      placehint: 'اسيا',
      placedetials: 'جبل إيفْرِستْ أعلى جبل على وجه الأرض، حيث يرتفع إلى حوالي 9كم عن سطح البحر. وهو أحد الجبال التي تتكوّن منها سلاسل جبال الهملايا، على حدودالصين ونيبال وشمالي الهند. اكتشفه الأوروبيون لأول مرة في 1847 وبعد بضع سنوات من الملاحظات والحسابات، قدر ارتفاعه بـ 8848 متر وعرف كأعلى قمة في العالم. ',
      placestars: 4,

      placeimage: 'img/images.jpg',
      placeprice: '\$8000'),
        places(
      placename: 'جبل موسي',
      placehint: 'مصر',
      placedetials: 'جبل موسى أو جبل سيناء أو الطور أو حوريب أو جبل حوريب هو الجبل الذي أعطيت فيه الوصايا العشر لموسى من قبل الرب، وفقًا لكتاب تثنية التثنية في الكتاب المقدس العبري. هو وصفها في مكانين كما «جبل الله». الجبل يسمى أيضا جبل يهوه. في فقرات كتابية أخرى، توصف هذه الأحداث بأنها حدثت في جبل سيناء',
      placestars: 4,

      placeimage: 'img/download (1).jpg',
      placeprice: '\$1000'),
        places(
      placename: 'جبل كاترين',
      placehint: 'مصر',
      placestars: 4,

      placedetials: 'جبل كاترين أو جبل القديسة كاترينا يقع في محافظة جنوب سيناء في مصر، ويعتبر من أعلى الجبال في سيناء ويبلغ ارتفاعه 2.629 م فوق سطح البحر، تتساقط على الجبل الثلوج في فصل الشتاء مثل باقى جبال منطقة جنوب سيناء.',
      placeimage: 'img/images (1).jpg',
      placeprice: '\$5000'),
      
];
