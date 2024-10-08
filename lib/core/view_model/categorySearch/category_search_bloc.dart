import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/models/category_search/category_search.dart';
import 'package:ecommerce/core/service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_search_event.dart';
part 'category_search_state.dart';
part 'category_search_bloc.freezed.dart';

class CategorySearchBloc
    extends Bloc<CategorySearchEvent, CategorySearchState> {
  CategorySearchBloc() : super(_Initial()) {
    on<_CategorySearch>((event, emit) async {
      emit(const CategorySearchState.loading());
      final response = await ProductService.fetchProductsByCategory(
        category: event.query,
        limit: 6,
        page: event.page,
      );

      response.fold((failure) {
         if (failure == "No Internet") {
          emit(const CategorySearchState.noInternet());
        } else {
          emit(CategorySearchState.failure(failure.toString()));
        }
      }, (success) {
        emit(CategorySearchState.success(success));
      });
    });
  }
}
