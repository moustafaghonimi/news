import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/newsResponces.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetiels extends StatelessWidget {
  static const String routeName = 'newsdetiles';

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute
        .of(context)!
        .settings
        .arguments as Articles;
    return Stack(

      children: [
        Image.asset(
          'assats/images/pattern.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.white.withOpacity(0.95),

          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0,

            centerTitle: true,
            title: Text('News Detiels'),
            shape: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl: articles.urlToImage!,
                        imageBuilder: (context, imageProvider) =>
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    ),
                              ),
                            ),
                        height: 180,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Text(
                    articles.author ?? '',
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    articles.publishedAt?.substring(0, 10) ?? '',
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    articles.description ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      _launchUrl(Uri.parse(articles.url ?? ''));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('View Full Artical', style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),),
                        Icon(Icons.read_more),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
}
