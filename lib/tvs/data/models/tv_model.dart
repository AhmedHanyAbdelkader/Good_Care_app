import '../../domain/entities/tv.dart';

class TvModel extends Tv{
  const TvModel({
    required super.backdropPath,
    required super.posterPath,
    required super.genreIds,
    required super.firstAirDate,
    required super.id,
    required super.name,
    required super.overView,
    required super.popularity,
    required super.voteAverage,
    required super.voteCoount,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        genreIds: json['genre_ids'], 
        firstAirDate: json['first_air_date'],
        id: json['id'],
        name: json['name'],
        overView: json['overview'],
        popularity: json['popularity'],
        voteAverage: json['vote_average'].toDouble(),
        voteCoount: json['vote_count'],
      );
}
