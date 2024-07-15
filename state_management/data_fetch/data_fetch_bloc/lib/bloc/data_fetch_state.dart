part of 'data_fetch_bloc.dart';

@freezed
class DataFetchState with _$DataFetchState {
  const factory DataFetchState.initial({
    @Default(false) bool isLoading,
    @Default([]) List<Post> posts,
  }) = _Initial;
}
