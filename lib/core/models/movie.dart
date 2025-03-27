import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@HiveType(typeId: 0)
@freezed
class Movie with _$Movie {
  @HiveField(0)
  const factory Movie({
    @HiveField(1) required int id,
    @HiveField(2) required String title,
    @HiveField(3) @JsonKey(name: 'poster_path') String? posterPath,
    @HiveField(4) @JsonKey(name: 'backdrop_path') String? backdropPath,
    @HiveField(5) @JsonKey(name: 'release_date') String? releaseDate,
    @HiveField(6) String? overview,
    @HiveField(7) @JsonKey(name: 'vote_average') double? voteAverage,
    @HiveField(8) @Default([]) List<String> genres,
    @HiveField(9) @Default(false) bool isFavorite,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
