part of 'news_home_cubit.dart';

class NewsHomeState extends Equatable {
  const NewsHomeState({
    this.newsModel,
    this.isLoading,
    this.isInitial = false,
  });

  final NewsModel? newsModel;
  final bool? isLoading;
  final bool isInitial;
  @override
  List<Object?> get props => [newsModel, isLoading];

  NewsHomeState copyWith({
    NewsModel? newsModel,
    bool? isLoading,
    bool? isInitial,
  }) {
    return NewsHomeState(
      newsModel: newsModel ?? this.newsModel,
      isLoading: isLoading ?? this.isLoading,
      isInitial: isInitial ?? this.isInitial,
    );
  }
}
