import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/newsResponces.dart';

import '../shared/styles/colors.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: articles.urlToImage!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter:
                    ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
              ),
            ),
            height: 180,
            placeholder: (context, url) => Center(child: CircularProgressIndicator ()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          // CachedNetworkImage(
          //   imageUrl:articles.urlToImage!,
          //   height: 180,
          //   width: double.infinity,
          //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          // ),
          Text(
            articles.author ?? '',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            articles.title ?? '',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            articles.publishedAt?.substring(0,10)??'',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
            textAlign: TextAlign.end,
          ),
          SizedBox(
            height: 6,
          ),
          Divider(
            height: 2,
            color: colorBlack,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
