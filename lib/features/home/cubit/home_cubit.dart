import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:news/features/home/model/product_model.dart';
import 'package:news/features/home/service/home_service.dart';
import 'package:news/product/constant/application_constant.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeService) : super(const HomeState()) {
    initialComplete();
  }
  final IHomeService homeService;
  // List<ProductModel>? products;

  void fetchNewItems() async {
    if (state.isLoading ?? false) {
      return;
    }
    _changeLoading();
    int _pageNumber = state.pageNumber ?? kOne.toInt();
    final response =
        await homeService.fetchAllProducts(count: ++_pageNumber * 5);
    _changeLoading();
    emit(state.copyWith(items: response, pageNumber: _pageNumber));
  }

  void selectedCategories(String data) {
    emit(state.copyWith(
        selectItems: state.items
            ?.where((element) => element.category == data)
            .toList()));
  }

  Future<void> initialComplete() async {
    await Future.wait([fetchAllItems(), fetchAllCategories()]);
    await Future.microtask(() {
      emit(HomeState(isInitial: true));
    });
    emit(state.copyWith(selectItems: state.items));
  }

  void uptade() {}

  Future<void> fetchAllItems() async {
    _changeLoading();
    final response = await homeService.fetchAllProducts();
    // products = response;
    emit(state.copyWith(items: response ?? []));
    _changeLoading();
  }

  void updateList(int index, ProductModel? model) {
    // final item = state.items?[index];
    if (model != null) {
      emit(state.copyWith(isUpdated: false));
      state.items?[index].price = (model.price ?? kZero) + 300;
      emit(state.copyWith(isUpdated: true));
    }
  }

  Future<void> fetchAllCategories() async {
    final response = await homeService.fetchAllCategories();
    emit(state.copyWith(categories: response));
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
