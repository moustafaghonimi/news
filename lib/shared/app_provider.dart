import 'package:flutter/cupertino.dart';

import 'package:news/shared/network/remote/api_manager.dart';

import '../models/searchResponce.dart';

class AppProvider extends ChangeNotifier{
String  query = '';
  bool isSearch = false;
   void changeSearch(bool value){
    isSearch = value;
    notifyListeners();
  }
  Future<SearchResponce?> searchRequest(query) async{
    await ApiManager.SearchInAll(query).then((value){
      return value;
    });
  }
}