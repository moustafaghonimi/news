import 'package:flutter/material.dart';
import 'package:news/screens/search_bar_anmaition.dart';
import 'package:news/screens/search_controler.dart';

import '../models/searchResponce.dart';

class SearchScreen extends StatelessWidget {
static const String routeName='searchScreen';
List<Articles> articles=[] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
           SearchIconBar(),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body:SearchControler(articles),
    );
  }
}
