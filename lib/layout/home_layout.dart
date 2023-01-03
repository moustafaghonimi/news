import 'package:flutter/material.dart';
import 'package:news/models/catogerie.dart';

import '../screens/catogeries/catogeries_Screen.dart';
import '../screens/home_screen.dart';
import '../screens/news/drawer_screen.dart';
import '../screens/search/searchScreen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assats/images/pattern.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.white.withOpacity(0.9),
          drawer: DrawerScreen(WhenOpenDrawer),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.green,
            actions: [
              selectedCatogryItem != null
                  ? IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      },
                      icon: Icon(Icons.search))
                  : const SizedBox(),
              // SearchIconBar()
            ],
            centerTitle: true,
            title: selectedCatogryItem == null
                ? Text('News App')
                : Text('All News'),
            shape: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
          ),
          body: selectedCatogryItem == null
              ? CatogeriesScreen(SelectedCatogryCallback)
              : HomeScreen(selectedCatogryItem!),
        ),
      ],
    );
  }

  static Catogrey? selectedCatogryItem = null;

  void WhenOpenDrawer(var selectedNumber) {
    if (selectedNumber == DrawerScreen.Catogrey_Num) {
      selectedCatogryItem = null;
    } else if (selectedNumber == DrawerScreen.Catogrey_Setting) {
      //open setting
    }
    setState(() {
      Navigator.pop(context);
    });
  }

  void SelectedCatogryCallback(Catogrey catogrey) {
    selectedCatogryItem = catogrey;
    setState(() {});
  }
}
