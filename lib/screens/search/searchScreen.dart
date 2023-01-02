import 'package:flutter/material.dart';
import 'package:news/screens/search/search_bar_anmaition.dart';

import 'package:provider/provider.dart';

import '../../models/searchResponce.dart';
import '../../shared/app_provider.dart';
import '../../shared/network/remote/api_manager.dart';

class SearchScreen extends StatelessWidget {
static const String routeName='searchScreen';
List<Articles> articles=[] ;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);

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
      body:DefaultTabController(

        length: articles.length,
        child: FutureBuilder<SearchResponce>(
          future: ApiManager.SearchInAll('sports'),

          builder: (context, snapshot) {
            if(provider.query==''){
              Text('No search done ',style: TextStyle(color: Colors.red),);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    Text('Something Has Error',style: TextStyle(color: Colors.black),),
                    TextButton(onPressed: () {}, child: Text('Try Again')),
                  ],
                ),
              );
            }
            if (snapshot.data?.status == 'error') {
              return Center(
                child: Column(
                  children: [
                    Text(snapshot.data?.message ?? 'style: TextStyle(color: Colors.black)'),
                    TextButton(onPressed: () {}, child: Text(' Again')),
                  ],
                ),
              );
            }
            var artical=snapshot.data?.articles??[];
            return Expanded(
              child: ListView.builder(
                itemBuilder:(context, index) {
                  return Container() ;
                },
                itemCount: artical.length,
              ),
            );
          },

        ),
      ),
    );
  }
}
