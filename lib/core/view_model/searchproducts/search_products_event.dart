part of 'search_products_bloc.dart';

@freezed
class SearchProductsEvent with _$SearchProductsEvent {
  const factory SearchProductsEvent.started() = _Started;
  const factory SearchProductsEvent.searchProducts({required String keyword}) =
      _SearchProducts;
}
