import 'package:flutter/material.dart';
import 'package:news/models/searchResponce.dart';
import 'package:news/shared/network/remote/api_manager.dart';
import 'package:provider/provider.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../../shared/app_provider.dart';


class SearchIconBar extends StatelessWidget {
  TextEditingController controller =TextEditingController();
  List<Articles> articles=[] ;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);

    return SearchBarAnimation(

      onChanged: (value){
        provider.searchRequest(value);
        provider.query=value;
        print(provider.query);

        // return ListView.builder(itemBuilder: (context, index) {
        //   ApiManager.SearchInAll(controller.text).then((value) {
        //    return articles[index].title==controller.text;
        //   }
        //   );
        //
        //   }, itemCount: articles.length,);
      },

      searchBoxWidth: MediaQuery.of(context).size.width*.85,
      textEditingController: controller,

      isOriginalAnimation: true,
      enableKeyboardFocus: true,
      onExpansionComplete: () {
        debugPrint(
            'do something just after searchbox is opened.');
      },
      onCollapseComplete: () {
        debugPrint(
            'do something just after searchbox is closed.');
      },
      onPressButton: (isSearchBarOpens) {
        return Container(
          width: 200,
          color: Colors.white,
        );
        // List<Articles> articles = [];


        /*debugPrint(
            'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
*/

      },
      trailingWidget: const Icon(
        Icons.search,
        size: 20,
        color: Colors.black,
      ),
      secondaryButtonWidget: const Icon(
        Icons.close,
        size: 20,
        color: Colors.black,
      ),
      buttonWidget: const Icon(
        Icons.search,
        size: 20,
        color: Colors.black,
      ),
    );

  }

}

