import 'package:news/features/news_home/model/news_model.dart';
import 'package:news/product/padding/page_padding.dart';
import 'package:news/product/utility/image/project_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, this.model}) : super(key: key);
  final Articles? model;
  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return SizedBox.shrink();
    }
    return Padding(
      padding: PagePadding.all(),
      child: Card(
        child: ListTile(
          contentPadding: PagePadding.all(),
          title: SizedBox(
              height: context.height() * 0.2,
              child: ProjectNetworkImage.network(src: model?.urlToImage)),
          subtitle: Text(
            model.toString(),
            style: context.textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
