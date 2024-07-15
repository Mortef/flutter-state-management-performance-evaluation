// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_fetch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataFetchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPosts,
    required TResult Function() clearPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPosts,
    TResult? Function()? clearPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPosts,
    TResult Function()? clearPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPosts value) loadPosts,
    required TResult Function(_ClearPosts value) clearPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPosts value)? loadPosts,
    TResult? Function(_ClearPosts value)? clearPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPosts value)? loadPosts,
    TResult Function(_ClearPosts value)? clearPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataFetchEventCopyWith<$Res> {
  factory $DataFetchEventCopyWith(
          DataFetchEvent value, $Res Function(DataFetchEvent) then) =
      _$DataFetchEventCopyWithImpl<$Res, DataFetchEvent>;
}

/// @nodoc
class _$DataFetchEventCopyWithImpl<$Res, $Val extends DataFetchEvent>
    implements $DataFetchEventCopyWith<$Res> {
  _$DataFetchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadPostsImplCopyWith<$Res> {
  factory _$$LoadPostsImplCopyWith(
          _$LoadPostsImpl value, $Res Function(_$LoadPostsImpl) then) =
      __$$LoadPostsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadPostsImplCopyWithImpl<$Res>
    extends _$DataFetchEventCopyWithImpl<$Res, _$LoadPostsImpl>
    implements _$$LoadPostsImplCopyWith<$Res> {
  __$$LoadPostsImplCopyWithImpl(
      _$LoadPostsImpl _value, $Res Function(_$LoadPostsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadPostsImpl implements _LoadPosts {
  const _$LoadPostsImpl();

  @override
  String toString() {
    return 'DataFetchEvent.loadPosts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadPostsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPosts,
    required TResult Function() clearPosts,
  }) {
    return loadPosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPosts,
    TResult? Function()? clearPosts,
  }) {
    return loadPosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPosts,
    TResult Function()? clearPosts,
    required TResult orElse(),
  }) {
    if (loadPosts != null) {
      return loadPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPosts value) loadPosts,
    required TResult Function(_ClearPosts value) clearPosts,
  }) {
    return loadPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPosts value)? loadPosts,
    TResult? Function(_ClearPosts value)? clearPosts,
  }) {
    return loadPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPosts value)? loadPosts,
    TResult Function(_ClearPosts value)? clearPosts,
    required TResult orElse(),
  }) {
    if (loadPosts != null) {
      return loadPosts(this);
    }
    return orElse();
  }
}

abstract class _LoadPosts implements DataFetchEvent {
  const factory _LoadPosts() = _$LoadPostsImpl;
}

/// @nodoc
abstract class _$$ClearPostsImplCopyWith<$Res> {
  factory _$$ClearPostsImplCopyWith(
          _$ClearPostsImpl value, $Res Function(_$ClearPostsImpl) then) =
      __$$ClearPostsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearPostsImplCopyWithImpl<$Res>
    extends _$DataFetchEventCopyWithImpl<$Res, _$ClearPostsImpl>
    implements _$$ClearPostsImplCopyWith<$Res> {
  __$$ClearPostsImplCopyWithImpl(
      _$ClearPostsImpl _value, $Res Function(_$ClearPostsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearPostsImpl implements _ClearPosts {
  const _$ClearPostsImpl();

  @override
  String toString() {
    return 'DataFetchEvent.clearPosts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearPostsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPosts,
    required TResult Function() clearPosts,
  }) {
    return clearPosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPosts,
    TResult? Function()? clearPosts,
  }) {
    return clearPosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPosts,
    TResult Function()? clearPosts,
    required TResult orElse(),
  }) {
    if (clearPosts != null) {
      return clearPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPosts value) loadPosts,
    required TResult Function(_ClearPosts value) clearPosts,
  }) {
    return clearPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPosts value)? loadPosts,
    TResult? Function(_ClearPosts value)? clearPosts,
  }) {
    return clearPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPosts value)? loadPosts,
    TResult Function(_ClearPosts value)? clearPosts,
    required TResult orElse(),
  }) {
    if (clearPosts != null) {
      return clearPosts(this);
    }
    return orElse();
  }
}

abstract class _ClearPosts implements DataFetchEvent {
  const factory _ClearPosts() = _$ClearPostsImpl;
}

/// @nodoc
mixin _$DataFetchState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Post> get posts => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<Post> posts) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<Post> posts)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<Post> posts)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataFetchStateCopyWith<DataFetchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataFetchStateCopyWith<$Res> {
  factory $DataFetchStateCopyWith(
          DataFetchState value, $Res Function(DataFetchState) then) =
      _$DataFetchStateCopyWithImpl<$Res, DataFetchState>;
  @useResult
  $Res call({bool isLoading, List<Post> posts});
}

/// @nodoc
class _$DataFetchStateCopyWithImpl<$Res, $Val extends DataFetchState>
    implements $DataFetchStateCopyWith<$Res> {
  _$DataFetchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $DataFetchStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Post> posts});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DataFetchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? posts = null,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isLoading = false, final List<Post> posts = const []})
      : _posts = posts;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Post> _posts;
  @override
  @JsonKey()
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'DataFetchState.initial(isLoading: $isLoading, posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<Post> posts) initial,
  }) {
    return initial(isLoading, posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<Post> posts)? initial,
  }) {
    return initial?.call(isLoading, posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<Post> posts)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading, posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DataFetchState {
  const factory _Initial({final bool isLoading, final List<Post> posts}) =
      _$InitialImpl;

  @override
  bool get isLoading;
  @override
  List<Post> get posts;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
