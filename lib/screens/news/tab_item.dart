import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/soursesResponse.dart';

class TabItems extends StatelessWidget {
  Sources sources;
  bool isSelected;

  TabItems(this.sources, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color:isSelected ? Colors.green : Colors.transparent ,
      ),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 8),

      child: Text(
        sources.name ?? '',
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: isSelected ? Colors.white : Colors.green,
            ),
      ),
    );
  }
}
