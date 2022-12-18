import 'package:flutter/cupertino.dart';
import 'package:news/models/catogerie.dart';

class CatogeriesItem extends StatelessWidget {
  Catogrey catogrey;
int index;
  CatogeriesItem(this.catogrey,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: catogrey.colorBg,
        borderRadius: BorderRadius.only(
          topLeft:  Radius.circular(16),
          topRight:  Radius.circular(16),
          bottomLeft:index%2==0?Radius.circular(12):Radius.circular(0) ,
          bottomRight:index%2==0?Radius.circular(0):Radius.circular(12) ,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(catogrey.image,width: 120,height: 120,)),
          Center(child: Text(catogrey.title)),
        ],
      ),
    );
  }
}
