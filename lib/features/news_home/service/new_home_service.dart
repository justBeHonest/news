import 'package:news/features/news_home/model/news_model.dart';
import 'package:news/product/constant/application_constant.dart';
import 'package:news/product/model/query/news_queries.dart';
import 'package:vexana/vexana.dart';

enum _NewsHomeServicePath { v2, everything }

abstract class INewsHomeService {
  late final INetworkManager _networkManager;
  INewsHomeService(INetworkManager networkManager)
      : _networkManager = networkManager;
  Future<NewsModel?> fetchAllNews(
      {required String q, int? pageSize, int? page, String? apiKey});
}

class NewsHomeService extends INewsHomeService {
  NewsHomeService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<NewsModel?> fetchAllNews(
      {required String q, int? pageSize, int? page, String? apiKey}) async {
    final response = await _networkManager.send<NewsModel, NewsModel>(
      ('${_NewsHomeServicePath.v2.name}/${_NewsHomeServicePath.everything.name}'),
      parseModel: NewsModel(),
      method: RequestType.GET,
      queryParameters: Map.fromEntries(
        [
          NewsQueries.apiKey
              .toMapEntry(apiKey: apiKey ?? ApplicationConstant.instane.apiKey),
          NewsQueries.q.toMapEntry(q: q),
          NewsQueries.pageSize.toMapEntry(pageSize: pageSize ?? 10),
          NewsQueries.page.toMapEntry(page: page ?? 1),
        ],
      ),
    );
    return response.data;
  }
}
