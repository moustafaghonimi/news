import 'package:flutter/material.dart';
import 'package:news/models/catogerie.dart';
import 'package:news/screens/tab_controler.dart';

import '../models/soursesResponse.dart';
import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {
 Catogrey catogrey;


 HomeScreen(this.catogrey);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SoursesResponse>(
      future: ApiManager.getSources(catogrey.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text('Something Has Error'),
                TextButton(onPressed: () {}, child: Text('Try Again')),
              ],
            ),
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                TextButton(onPressed: () {}, child: Text('Try Again')),
              ],
            ),
          );
        }
        var sourses = snapshot.data?.sources ?? [];
        return TapControlerScreen(sourses);


      },
    );
  }
}
