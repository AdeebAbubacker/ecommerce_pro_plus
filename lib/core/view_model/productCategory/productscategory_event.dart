part of 'productscategory_bloc.dart';

@freezed
class ProductscategoryEvent with _$ProductscategoryEvent {
  const factory ProductscategoryEvent.started() = _Started;
  const factory ProductscategoryEvent.getProductsCategory() = _GetProductsCategory;
}