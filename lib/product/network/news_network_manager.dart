import 'package:news/features/news_home/model/news_model.dart';
import 'package:news/product/constant/application_constant.dart';
import 'package:vexana/vexana.dart';

class NewsNetworkManager extends NetworkManager<NewsModel> {
  NewsNetworkManager()
      : super(
          options:
              BaseOptions(baseUrl: ApplicationConstant.instane.newsBaseUrl),
        );
}
