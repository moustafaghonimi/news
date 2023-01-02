
import 'package:flutter/material.dart';
import 'package:news/layout/home_layout.dart';

class DrawerScreen extends StatelessWidget {
Function drawerAction;
static int Catogrey_Num=1;
static int Catogrey_Setting=2;


DrawerScreen(this.drawerAction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.80,
      color: Colors.white,
      height: MediaQuery.of(context).size.height*0.95,
      child: Column(
        children: [
          Container(
            width:    double.infinity,
            height: MediaQuery.of(context).size.height*0.20,
            color: Colors.green,
            child: Center(
              child: Text('News App!!',style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,),
            ),
          ),
          //SizedBox(
          //   height: 20,
          // ),
          InkWell(
            onTap: () {
              drawerAction(Catogrey_Num);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.menu),
                  SizedBox(width: 8,),
                  Text('Catogeris ',style: TextStyle(fontSize: 25),)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              drawerAction(Catogrey_Setting);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 8,),
                  Text('Settings ',style: TextStyle(fontSize: 25),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
