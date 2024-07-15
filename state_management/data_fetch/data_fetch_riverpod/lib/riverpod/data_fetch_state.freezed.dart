// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_fetch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataFetchState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Post> get posts => throw _privateConstructorUsedError;

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
abstract class _$$DataFetchStateImplCopyWith<$Res>
    implements $DataFetchStateCopyWith<$Res> {
  factory _$$DataFetchStateImplCopyWith(_$DataFetchStateImpl value,
          $Res Function(_$DataFetchStateImpl) then) =
      __$$DataFetchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Post> posts});
}

/// @nodoc
class __$$DataFetchStateImplCopyWithImpl<$Res>
    extends _$DataFetchStateCopyWithImpl<$Res, _$DataFetchStateImpl>
    implements _$$DataFetchStateImplCopyWith<$Res> {
  __$$DataFetchStateImplCopyWithImpl(
      _$DataFetchStateImpl _value, $Res Function(_$DataFetchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? posts = null,
  }) {
    return _then(_$DataFetchStateImpl(
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

class _$DataFetchStateImpl implements _DataFetchState {
  const _$DataFetchStateImpl(
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
    return 'DataFetchState(isLoading: $isLoading, posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataFetchStateImpl &&
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
  _$$DataFetchStateImplCopyWith<_$DataFetchStateImpl> get copyWith =>
      __$$DataFetchStateImplCopyWithImpl<_$DataFetchStateImpl>(
          this, _$identity);
}

abstract class _DataFetchState implements DataFetchState {
  const factory _DataFetchState(
      {final bool isLoading, final List<Post> posts}) = _$DataFetchStateImpl;

  @override
  bool get isLoading;
  @override
  List<Post> get posts;
  @override
  @JsonKey(ignore: true)
  _$$DataFetchStateImplCopyWith<_$DataFetchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
