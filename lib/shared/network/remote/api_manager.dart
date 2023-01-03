import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/searchResponce.dart';

import '../../../models/newsResponces.dart';
import '../../../models/soursesResponse.dart';
import '../../componant/constant.dart';

class ApiManager {

  static Future<SoursesResponse> getSources(String categoryId) async {
    Uri URL = Uri.https(BASE, '/v2/top-headlines/sources', {
      'apiKey': APIKEY,
      'category':categoryId
    });
    Response sourses = await http.get(URL);
    try {
      var json = jsonDecode(sourses.body);
      SoursesResponse soursesResponse = SoursesResponse.fromJson(json);
      return soursesResponse;
    }
    catch (e) {
      throw e;
    }
  }

  static Future<NewsResponces> getNews({String? sourseId,String? quary})async {
    //https://newsapi.org/v2/everything?apiKey=e06fed622a494ed28382a5d363f99ca1&sources=abc-news
    Uri URL = Uri.https(BASE, '/v2/everything',
        {
          'apiKey': APIKEY,
          'Sources': sourseId,
          'q':quary
        }
    );
   Response newsData=await http.get(URL);
   
   try{
     var json=jsonDecode(newsData.body);
     NewsResponces newsResponces=NewsResponces.fromJson(json);
     return newsResponces;
   }
   catch (e) {
     print('erorr is ------ > ${e}');
     throw e;

   }

  }
 // static Future<SearchResponce> SearchInAll(String value)async{
 //    //https://newsapi.org/v2/everything?apiKey=e06fed622a494ed28382a5d363f99ca1&q=crypto
 //    Uri URL=Uri.https(BASE,'/v2/everything',{
 //      'apiKey':APIKEY,
 //      'q':value,
 //
 //    });
 //    Response searchData=await http.get(URL);
 //    try{
 //      var json=jsonDecode(searchData.body);
 //      SearchResponce searchResponce=SearchResponce.fromJson(json);
 //      return searchResponce;
 //    }
 //    catch (e) {
 //      print('erorr is ------ > ${e}');
 //      throw e;
 //
 //    }
 //  }
  
}