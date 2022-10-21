import 'package:flutter/material.dart';
import '../widgets/mytexspan.dart';

class ArticlePage extends StatelessWidget {
  final String article;
  final String highlight;
  final myTextSpans = <String, Function>{
    'a': (String text) => highlightedTextSpan(text),
    'z': (String text) => defaultTextSpan(text),
  };
ArticlePage(this.article,this.highlight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter RichText'),
      ),
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: decorateArticle(article)),
        ),
      ),
    );
  }

  List<InlineSpan> decorateArticle(String article) {
    var childern = <InlineSpan>[];

    article.split(highlight).forEach((element) {
      if (element.contains(highlight)) {
       childern.add(myTextSpans['a']!(element));
      } else {
        childern.add(myTextSpans['z']!(element));
      }
    });
    print(childern);

    return childern;
  }
}