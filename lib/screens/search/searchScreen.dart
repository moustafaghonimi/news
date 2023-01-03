import 'package:flutter/material.dart';
import 'package:news/screens/news/news_item.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../../models/newsResponces.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'searchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String quary = '';
  List<Articles> newsList = [];

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
          backgroundColor: Colors.white.withOpacity(0.7),

          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0,
            toolbarHeight: 80,
            shape: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            leading: SizedBox(),
            leadingWidth: 10,
            title: Container(
              height: 65,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    quary = value;
                  });
                  print(quary);
                  print('======================');
                  print(search());
                },
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.green, height: 0.8),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: 'Search Artical',
                  hintStyle:
                      TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 15),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                  prefixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey,
                      )),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) => NewsItem(search().elementAt(index)),
            itemCount: search().length,
          ),
        ),
      ],
    );
  }

  List<Articles> search() {
    ApiManager.getNews(quary: quary)
        .then((newsResponces) => {newsList = newsResponces.articles ?? []})
        .catchError((error) {
      debugPrint('Error in Api ${error}');
    });
    return newsList;
  }
}
