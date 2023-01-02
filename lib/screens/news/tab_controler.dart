import 'package:flutter/material.dart';
import 'package:news/models/newsResponces.dart';
import 'package:news/screens/news/tab_item.dart';
import 'package:provider/provider.dart';


import '../../models/soursesResponse.dart';
import '../../shared/app_provider.dart';
import '../../shared/network/remote/api_manager.dart';
import 'news_item.dart';


class TapControlerScreen extends StatefulWidget {
  List<Sources> sources;

  TapControlerScreen(this.sources);

  @override
  State<TapControlerScreen> createState() => _TapControlerScreenState();
}

class _TapControlerScreenState extends State<TapControlerScreen> {
  int isSelectedIndex = 0;
bool ischanged=true;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);

    return DefaultTabController(
      
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            onTap: (index) {
              isSelectedIndex = index;
              setState(() {});
            },
            labelColor: Colors.blue,
            indicatorColor: Colors.transparent,
            tabs: widget.sources
                .map((sourc) => TabItems(
                    sourc,
                    isSelectedIndex == widget.sources.indexOf(sourc)
                        ? true
                        : false))
                .toList(),
          ),
          FutureBuilder<NewsResponces>(
            future: ApiManager.getNews(widget.sources[isSelectedIndex].id!),

              builder: (context, snapshot) {
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
                        TextButton(onPressed: () {}, child: Text('Try Again')),
                      ],
                    ),
                  );
                }
                var newsData=snapshot.data?.articles??[];
                return Expanded(
                  child: ListView.builder(
                      itemBuilder:(context, index) {
                        return NewsItem(newsData[index]);
                      },
                    itemCount: newsData.length,
                       ),
                );
              },

          )
          
        ],
      ),
    );
  }
}
