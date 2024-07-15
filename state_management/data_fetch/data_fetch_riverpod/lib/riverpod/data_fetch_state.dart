import 'package:data_fetch_riverpod/api/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_fetch_state.freezed.dart';

@freezed
class DataFetchState with _$DataFetchState {
  const factory DataFetchState({
    @Default(false) bool isLoading,
    @Default([]) List<Post> posts,
  }) = _DataFetchState;
}
