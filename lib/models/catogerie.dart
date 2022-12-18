

import 'dart:ui';

class Catogrey{
  String id;
  String title;
  String image;
  Color colorBg;

  Catogrey(this.id, this.title, this.image, this.colorBg);

 static List<Catogrey> getCatogeries(){
  return [
    Catogrey('business', 'business', 'assats/images/bussines.png', Color(
        0xe5084fe8)),
    Catogrey('entertainment', 'entertainment', 'assats/images/environment.png', Color(
        0xe504da41)),
    Catogrey('health', 'health', 'assats/images/health.png', Color(0x9bf5068d)),
    Catogrey('science', 'science', 'assats/images/science.png', Color(
        0xe5f1d104)),
    Catogrey('sports', 'sports', 'assats/images/sports.png', Color(0xffe80923)),
    Catogrey('technology', 'technology', 'assats/images/Politics.png', Color(
        0xe5ef4d07)),
  ];
 }
}