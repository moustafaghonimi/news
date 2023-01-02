// import 'package:flutter/material.dart';
// import 'package:news/models/searchResponce.dart';
// import 'package:news/screens/searchScreen.dart';
// import 'package:provider/provider.dart';
//
// import '../shared/app_provider.dart';
// import '../shared/network/remote/api_manager.dart';
//
//
// class SearchControler extends StatefulWidget {
//   List<Articles> articals;
//
//
//   SearchControler(this.articals);
//
//   @override
//   State<SearchControler> createState() => _SearchControler();
// }
//
// class _SearchControler extends State<SearchControler> {
//   int isSelectedIndex = 0;
// bool ischanged=true;
//   @override
//   Widget build(BuildContext context) {
//     var provider=Provider.of<AppProvider>(context);
//
//     return DefaultTabController(
//
//       length: widget.articals.length,
//       child: FutureBuilder<SearchResponce>(
//         future: ApiManager.SearchInAll(provider.query),
//
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }
//             if (snapshot.hasError) {
//               return Center(
//                 child: Column(
//                   children: [
//                     Text('Something Has Error',style: TextStyle(color: Colors.black),),
//                     TextButton(onPressed: () {}, child: Text('Try Again')),
//                   ],
//                 ),
//               );
//             }
//             if (snapshot.data?.status == 'error') {
//               return Center(
//                 child: Column(
//                   children: [
//                     Text(snapshot.data?.message ?? 'style: TextStyle(color: Colors.black)'),
//                     TextButton(onPressed: () {}, child: Text('Try Again')),
//                   ],
//                 ),
//               );
//             }
//             var artical=snapshot.data?.articles??[];
//             return Expanded(
//               child: ListView.builder(
//                   itemBuilder:(context, index) {
//                     return Container(
//
//                     ) ;
//                   },
//                 itemCount: artical.length,
//                    ),
//             );
//           },
//
//       ),
//     );
//   }
// }
