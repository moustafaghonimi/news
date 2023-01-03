import 'package:flutter/material.dart';
import 'package:news/layout/home_layout.dart';
import 'package:news/screens/news/news_detiles.dart';
import 'package:news/screens/search/searchScreen.dart';
import 'package:news/shared/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        SearchScreen.routeName:(c)=>SearchScreen(),
        NewsDetiels.routeName:(c)=>NewsDetiels(),
      },
    );
  }
}
