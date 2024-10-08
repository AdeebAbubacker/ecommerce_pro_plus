import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/models/search_products_model/search_products_model.dart';
import 'package:ecommerce/core/service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_products_event.dart';
part 'search_products_state.dart';
part 'search_products_bloc.freezed.dart';

class SearchProductsBloc
    extends Bloc<SearchProductsEvent, SearchProductsState> {
  SearchProductsBloc() : super(_Initial()) {
    on<_SearchProducts>((event, emit) async {
      emit(const SearchProductsState.loading());
      final response =
          await ProductService.searchProducts(query: event.keyword);

      response.fold((failure) {
        if (failure == "No Internet") {
          emit(const SearchProductsState.noInternet());
        } else {
          emit(SearchProductsState.failure(failure.toString()));
        }
      }, (success) {
        emit(SearchProductsState.success(success));
      });
    });
  }
}
