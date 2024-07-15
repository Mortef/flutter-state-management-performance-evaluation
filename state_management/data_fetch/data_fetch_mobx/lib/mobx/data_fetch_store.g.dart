// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_fetch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataFetchStore on _DataFetchStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_DataFetchStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$postsAtom =
      Atom(name: '_DataFetchStore.posts', context: context);

  @override
  List<Post> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<Post> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$loadPostsAsyncAction =
      AsyncAction('_DataFetchStore.loadPosts', context: context);

  @override
  Future<void> loadPosts() {
    return _$loadPostsAsyncAction.run(() => super.loadPosts());
  }

  late final _$clearPostsAsyncAction =
      AsyncAction('_DataFetchStore.clearPosts', context: context);

  @override
  Future<void> clearPosts() {
    return _$clearPostsAsyncAction.run(() => super.clearPosts());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
posts: ${posts}
    ''';
  }
}
