import 'package:data_fetch_bloc/api/api_service.dart';
import 'package:data_fetch_bloc/api/models/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_fetch_bloc.freezed.dart';
part 'data_fetch_event.dart';
part 'data_fetch_state.dart';

class DataFetchBloc extends Bloc<DataFetchEvent, DataFetchState> {
  DataFetchBloc() : super(const _Initial()) {
    on<DataFetchEvent>((event, emit) async {
      await event.map(
        loadPosts: (e) async {
          emit(state.copyWith(isLoading: true));
          final posts = await fetchPosts();
          emit(state.copyWith(isLoading: false, posts: posts));
        },
        clearPosts: (e) async {
          emit(state.copyWith(posts: const []));
        },
      );
    });
  }
}
