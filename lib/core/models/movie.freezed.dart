// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  @HiveField(1)
  int get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'release_date')
  String? get releaseDate => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get overview => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @HiveField(8)
  List<String> get genres => throw _privateConstructorUsedError;
  @HiveField(9)
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Serializes this Movie to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res, Movie>;
  @useResult
  $Res call(
      {@HiveField(1) int id,
      @HiveField(2) String title,
      @HiveField(3) @JsonKey(name: 'poster_path') String? posterPath,
      @HiveField(4) @JsonKey(name: 'backdrop_path') String? backdropPath,
      @HiveField(5) @JsonKey(name: 'release_date') String? releaseDate,
      @HiveField(6) String? overview,
      @HiveField(7) @JsonKey(name: 'vote_average') double? voteAverage,
      @HiveField(8) List<String> genres,
      @HiveField(9) bool isFavorite});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res, $Val extends Movie>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? releaseDate = freezed,
    Object? overview = freezed,
    Object? voteAverage = freezed,
    Object? genres = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieImplCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$MovieImplCopyWith(
          _$MovieImpl value, $Res Function(_$MovieImpl) then) =
      __$$MovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) int id,
      @HiveField(2) String title,
      @HiveField(3) @JsonKey(name: 'poster_path') String? posterPath,
      @HiveField(4) @JsonKey(name: 'backdrop_path') String? backdropPath,
      @HiveField(5) @JsonKey(name: 'release_date') String? releaseDate,
      @HiveField(6) String? overview,
      @HiveField(7) @JsonKey(name: 'vote_average') double? voteAverage,
      @HiveField(8) List<String> genres,
      @HiveField(9) bool isFavorite});
}

/// @nodoc
class __$$MovieImplCopyWithImpl<$Res>
    extends _$MovieCopyWithImpl<$Res, _$MovieImpl>
    implements _$$MovieImplCopyWith<$Res> {
  __$$MovieImplCopyWithImpl(
      _$MovieImpl _value, $Res Function(_$MovieImpl) _then)
      : super(_value, _then);

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? releaseDate = freezed,
    Object? overview = freezed,
    Object? voteAverage = freezed,
    Object? genres = null,
    Object? isFavorite = null,
  }) {
    return _then(_$MovieImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveField(0)
class _$MovieImpl implements _Movie {
  const _$MovieImpl(
      {@HiveField(1) required this.id,
      @HiveField(2) required this.title,
      @HiveField(3) @JsonKey(name: 'poster_path') this.posterPath,
      @HiveField(4) @JsonKey(name: 'backdrop_path') this.backdropPath,
      @HiveField(5) @JsonKey(name: 'release_date') this.releaseDate,
      @HiveField(6) this.overview,
      @HiveField(7) @JsonKey(name: 'vote_average') this.voteAverage,
      @HiveField(8) final List<String> genres = const [],
      @HiveField(9) this.isFavorite = false})
      : _genres = genres;

  factory _$MovieImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieImplFromJson(json);

  @override
  @HiveField(1)
  final int id;
  @override
  @HiveField(2)
  final String title;
  @override
  @HiveField(3)
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @HiveField(4)
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @HiveField(5)
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @override
  @HiveField(6)
  final String? overview;
  @override
  @HiveField(7)
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  final List<String> _genres;
  @override
  @JsonKey()
  @HiveField(8)
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  @JsonKey()
  @HiveField(9)
  final bool isFavorite;

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, posterPath: $posterPath, backdropPath: $backdropPath, releaseDate: $releaseDate, overview: $overview, voteAverage: $voteAverage, genres: $genres, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      posterPath,
      backdropPath,
      releaseDate,
      overview,
      voteAverage,
      const DeepCollectionEquality().hash(_genres),
      isFavorite);

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      __$$MovieImplCopyWithImpl<_$MovieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieImplToJson(
      this,
    );
  }
}

abstract class _Movie implements Movie {
  const factory _Movie(
      {@HiveField(1) required final int id,
      @HiveField(2) required final String title,
      @HiveField(3) @JsonKey(name: 'poster_path') final String? posterPath,
      @HiveField(4) @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @HiveField(5) @JsonKey(name: 'release_date') final String? releaseDate,
      @HiveField(6) final String? overview,
      @HiveField(7) @JsonKey(name: 'vote_average') final double? voteAverage,
      @HiveField(8) final List<String> genres,
      @HiveField(9) final bool isFavorite}) = _$MovieImpl;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$MovieImpl.fromJson;

  @override
  @HiveField(1)
  int get id;
  @override
  @HiveField(2)
  String get title;
  @override
  @HiveField(3)
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @HiveField(4)
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @HiveField(5)
  @JsonKey(name: 'release_date')
  String? get releaseDate;
  @override
  @HiveField(6)
  String? get overview;
  @override
  @HiveField(7)
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @HiveField(8)
  List<String> get genres;
  @override
  @HiveField(9)
  bool get isFavorite;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
