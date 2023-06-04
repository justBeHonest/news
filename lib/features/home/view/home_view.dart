import 'package:news/features/home/cubit/home_cubit.dart';
import 'package:news/features/home/service/home_service.dart';
import 'package:news/product/constant/application_constant.dart';
import 'package:news/product/network/product_network_manager.dart';
import 'package:news/product/widget/loading_center_widget.dart';
import 'package:news/product/widget/product_card.dart';
import 'package:news/product/widget/product_drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _listenScroll(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent) {
        context.read<HomeCubit>().fetchNewItems();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeService(ProductNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          title: _dropDownProject(),
          centerTitle: false,
          actions: [_loadingCenter()],
        ),
        body: _bodyListView(),
      ),
    );
  }

  Widget _dropDownProject() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ProductDropdown(
          items: state.categories ?? [],
          onSelected: (String data) {
            context.read<HomeCubit>().selectedCategories(data);
          },
        );
      },
    );
  }

  Widget _bodyListView() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.isInitial) {
          _listenScroll(context);
        }
      },
      builder: (context, state) {
        return ListView.builder(
            controller: _scrollController,
            itemCount: state.selectItems?.length ?? kZero.toInt(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ProductCard(model: state.selectItems?[index]),
                  state.selectItems.isNotNullOrEmpty &&
                          index == state.selectItems!.length - 1
                      ? const LoadingCenterWidget()
                      : const SizedBox.shrink(),
                  TextButton(
                    onPressed: () {
                      context
                          .read<HomeCubit>()
                          .updateList(index, state.selectItems?[index]);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${state.selectItems?[index].price ?? kZero}'),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                ],
              );
            });
      },
    );
  }

  Widget _loadingCenter() {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state ? kOne : kZero,
          duration: context.durationLow,
          child: LoadingCenterWidget(),
        );
      },
    );
  }
}

// class _ProductChangeDropdown extends StatelessWidget {
//   const _ProductChangeDropdown({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ProductDropdown(items: items);
//   }
// }
