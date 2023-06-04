import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news/features/news_home/model/news_model.dart';
import 'package:news/product/padding/page_padding.dart';
import 'package:news/product/utility/image/project_network_image.dart';
import 'package:news/product/widget/h2.dart';
import 'package:news/product/widget/h3.dart';
import 'package:news/product/widget/h5.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    this.onPressed,
    this.model,
  }) : super(key: key);

  final void Function()? onPressed;
  final Articles? model;

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return SizedBox.shrink();
    }
    return Padding(
      padding: PagePadding.all(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          H2(
            model!.title!,
            textAlign: TextAlign.center,
          ),
          _verticalSpace(),
          SizedBox(
            width: context.width(),
            child: ProjectNetworkImage.network(src: model?.urlToImage),
          ).center(),
          _verticalSpace(),
          H3(model!.content!),
          _verticalSpace(),
          H3(model!.description!),
          _verticalSpace(),
          H3('Published at : ${model!.publishedAt}'),
          _verticalSpace(),
          H3('Source of news : ${model?.source?.name}'),
          _verticalSpace(),
          H3('Author : ${model?.author}'),
          _verticalSpace(),
          InkWell(
            onTap: onPressed,
            child: H5(
              model!.url!,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _verticalSpace() {
    return SizedBox(height: 16);
  }
}


// Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('${state.newsModel?.articles?[index].author}'),
//                     Text('${state.newsModel?.articles?[index].content}'),
//                     Text('${state.newsModel?.articles?[index].description}'),
//                     Text('${state.newsModel?.articles?[index].publishedAt}'),
//                     Text('${state.newsModel?.articles?[index].source?.name}'),
//                     Text('${state.newsModel?.articles?[index].title}'),
//                     TextButton(
//                       child: Text('${state.newsModel?.articles?[index].url}'),
//                       onPressed: () {
//                         context
//                             .read<NewsHomeCubit>()
//                             .openUrl(state.newsModel?.articles?[index].url);
//                       },
//                     ),
//                     Icon(Icons.add),
//                   ],
//                 ),