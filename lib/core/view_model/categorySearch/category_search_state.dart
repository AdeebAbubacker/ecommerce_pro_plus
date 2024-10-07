part of 'category_search_bloc.dart';

@freezed
class CategorySearchState with _$CategorySearchState {
  const factory CategorySearchState.initial() = _Initial;
  const factory CategorySearchState.loading() = _Loading;
  const factory CategorySearchState.success(CategorySearch categorySearch) =
      _Success;
  const factory CategorySearchState.failure(String error) = _Failure;
}
