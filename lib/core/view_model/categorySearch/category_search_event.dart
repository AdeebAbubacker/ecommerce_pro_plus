part of 'category_search_bloc.dart';

@freezed
class CategorySearchEvent with _$CategorySearchEvent {
  const factory CategorySearchEvent.started() = _Started;
  const factory CategorySearchEvent.categorySearch({required String query}) =
      _CategorySearch;
}
