part of 'data_fetch_bloc.dart';

@freezed
class DataFetchEvent with _$DataFetchEvent {
  const factory DataFetchEvent.loadPosts() = _LoadPosts;
  const factory DataFetchEvent.clearPosts() = _ClearPosts;
}
