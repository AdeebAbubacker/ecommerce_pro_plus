part of 'productscategory_bloc.dart';

@freezed
class ProductscategoryState with _$ProductscategoryState {
  const factory ProductscategoryState.initial() = _Initial;
  const factory ProductscategoryState.loading() = _Loading;
  const factory ProductscategoryState.success(
      List<ProductsCategory> getProducts) = _Success;
  const factory ProductscategoryState.noInternet() = _NoInternet;
  const factory ProductscategoryState.failure(String error) = _Failure;
}
