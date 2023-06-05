import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news/features/news_home/cubit/news_home_cubit.dart';
import 'package:news/features/news_home/service/new_home_service.dart';
import 'package:news/product/network/news_network_manager.dart';
import 'package:news/product/widget/app_bar_widget.dart';
import 'package:news/product/widget/favorite_button.dart';
import 'package:news/product/widget/h2.dart';
import 'package:news/product/widget/h3.dart';
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
        // TODO : Pagination implement edilecek
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsHomeCubit(NewsHomeService(NewsNetworkManager())),
      child: Scaffold(
        appBar: AppBarWidget(),
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
            // TODO : The _newsDetails method should be deleted and added to the NewsImage component, when I added it, I couldn't manage the state management and left it as a method.
            return _newsDetails(state, index, context);
          },
        );
      },
    );
  }

  Column _newsDetails(NewsHomeState state, int index, BuildContext context) {
    return Column(
      children: [
        H2(
          '${state.newsModel?.articles?[index].title}',
          textAlign: TextAlign.center,
        ),
        _verticalSpace(),
        NewsImage(url: state.newsModel?.articles?[index].urlToImage),
        _verticalSpace(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            H3('${state.newsModel?.articles?[index].content}'),
            _verticalSpace(),
            H3('${state.newsModel?.articles?[index].description}'),
            _verticalSpace(),
            H3('Author : ${state.newsModel?.articles?[index].author}'),
            _verticalSpace(),
            H3('Published at : ${state.newsModel?.articles?[index].publishedAt}'),
            _verticalSpace(),
            H3('Source : ${state.newsModel?.articles?[index].source?.name}'),
            _verticalSpace(),
            InkWell(
              child: H3(
                '${state.newsModel?.articles?[index].url}',
                color: blueColor,
              ),
              onTap: () {
                context
                    .read<NewsHomeCubit>()
                    .openUrl(state.newsModel?.articles?[index].url);
              },
            ),
            _verticalSpace(),
            FavoriteButton(
              isSelected: false,
              onTap: () {},
            ).center(),
            Divider(thickness: 5, height: 60),
          ],
        ).paddingAll(16),
      ],
    );
  }

  Widget _verticalSpace() {
    return SizedBox(height: 12);
  }
}
