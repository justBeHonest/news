import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_home_state.dart';

class NewsHomeCubit extends Cubit<NewsHomeState> {
  NewsHomeCubit() : super(NewsHomeInitial());
}
