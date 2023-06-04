import 'package:flutter_test/flutter_test.dart';
import 'package:news/features/news_home/model/news_model.dart';
import 'package:news/features/news_home/service/new_home_service.dart';
import 'package:news/product/constant/application_constant.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INewsHomeService homeService;

  setUp(() {
    homeService = NewsHomeService(
      NetworkManager<NewsModel>(
        isEnableLogger: true,
        isEnableTest: true,
        options: BaseOptions(baseUrl: ApplicationConstant.instane.newsBaseUrl),
        // errorModel: ErrorModel(),
      ),
    );
  });
  test("fetchAllNews - test for sample requewst", () async {
    final response = await homeService.fetchAllNews(
      q: "bitcoin",
      page: 1,
      pageSize: 10,
    );
    expect(response, isNotNull);
  });
}
