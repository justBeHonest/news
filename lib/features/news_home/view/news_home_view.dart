import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/news_home/cubit/news_home_cubit.dart';
import 'package:news/features/news_home/service/new_home_service.dart';
import 'package:news/product/network/news_network_manager.dart';
import 'package:news/product/widget/fixed_app_bar_white_theme.dart';
import 'package:news/product/widget/news_card.dart';

class NewsHomeView extends StatefulWidget {
  const NewsHomeView({super.key});

  @override
  State<NewsHomeView> createState() => _NewsHomeViewState();
}

class _NewsHomeViewState extends State<NewsHomeView> {
  final _scrollController = ScrollController();

  void _listenScroll(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent) {
        //context.read<NewsHomeCubit>().fetchNewItems();
        print("Pagination implement edilecek");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsHomeCubit(NewsHomeService(NewsNetworkManager())),
      child: Scaffold(
        appBar: FixedAppBarWhiteTheme(),
        body: _bodyListView(),
      ),
    );
  }

  Widget _bodyListView() {
    return BlocConsumer<NewsHomeCubit, NewsHomeState>(
      listener: (context, state) {
        if (state.isInitial) {
          _listenScroll(context);
        }
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.newsModel?.articles?.length,
          controller: _scrollController,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NewsCard(model: state.newsModel?.articles?[index]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${state.newsModel?.articles?[index].author}'),
                    Text('${state.newsModel?.articles?[index].content}'),
                    Text('${state.newsModel?.articles?[index].description}'),
                    Text('${state.newsModel?.articles?[index].publishedAt}'),
                    Text('${state.newsModel?.articles?[index].source?.name}'),
                    Text('${state.newsModel?.articles?[index].title}'),
                    TextButton(
                      child: Text('${state.newsModel?.articles?[index].url}'),
                      onPressed: () {
                        context
                            .read<NewsHomeCubit>()
                            .openUrl(state.newsModel?.articles?[index].url);
                      },
                    ),
                    Icon(Icons.add),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
