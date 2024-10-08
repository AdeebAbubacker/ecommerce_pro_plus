part of 'search_products_bloc.dart';

@freezed
class SearchProductsState with _$SearchProductsState {
  const factory SearchProductsState.initial() = _Initial;
  const factory SearchProductsState.loading() = _Loading;
  const factory SearchProductsState.success(
      SearchProductsModel getProducts) = _Success;
       const factory SearchProductsState.noInternet() = _NoInternet;
  const factory SearchProductsState.failure(String error) = _Failure;
}
