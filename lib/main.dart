import 'package:flutter/material.dart';
import 'package:news/layout/home_layout.dart';
import 'package:news/screens/news/news_detiles.dart';
import 'package:news/screens/search/searchScreen.dart';
import 'package:news/shared/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
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
