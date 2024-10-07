import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/models/products_category/products_category.dart';
import 'package:ecommerce/core/service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'productscategory_event.dart';
part 'productscategory_state.dart';
part 'productscategory_bloc.freezed.dart';

class ProductscategoryBloc
    extends Bloc<ProductscategoryEvent, ProductscategoryState> {
  ProductscategoryBloc() : super(_Initial()) {
    on<_GetProductsCategory>((event, emit) async {
      emit(const ProductscategoryState.loading());
      final response = await ProductService.fetchCategories();

      response.fold((failure) {
        emit(ProductscategoryState.failure(failure.toString()));
      }, (success) {
        emit(ProductscategoryState.success(success));
      });
    });
  }
}
