import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/catogerie.dart';

import 'catogeries_item.dart';

class CatogeriesScreen extends StatelessWidget {
  Function callback;

  CatogeriesScreen(this.callback);

  @override
  Widget build(BuildContext context) {
    var catogeries = Catogrey.getCatogeries();
    return Column(
      children: [
        Text(
          'Pick your category of interest',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: catogeries.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      callback(catogeries[index]);
                    },
                    child: CatogeriesItem(catogeries[index], index));
              },
            ),
          ),
        ),
      ],
    );
  }
}
