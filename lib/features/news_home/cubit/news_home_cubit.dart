import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/features/news_home/model/news_model.dart';
import 'package:news/features/news_home/service/new_home_service.dart';
import 'package:url_launcher/url_launcher.dart';

part 'news_home_state.dart';

class NewsHomeCubit extends Cubit<NewsHomeState> {
  NewsHomeCubit(this.homeService) : super(const NewsHomeState()) {
    initialComplete();
  }
  final INewsHomeService homeService;
  // List<ProductModel>? products;

  Future<void> initialComplete() async {
    await Future.wait([fetchAllItems()]);
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }

  Future<void> fetchAllItems() async {
    _changeLoading();
    final response = await homeService.fetchAllNews(q: "bitcoin");
    emit(state.copyWith(newsModel: response));
    _changeLoading();
  }

  Future<void> openUrl(String? url) async {
    if (!await launchUrl(Uri.parse(url!))) {
      throw Exception('Could not launch $url');
    }
  }
}
