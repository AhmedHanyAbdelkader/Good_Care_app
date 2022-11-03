import '../../domain/entities/movie.dart';

class MovieModel extends Movie{
  const MovieModel({
    required super.id,
    required super.title,
    required super.backDropPath,
    required super.genderId,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate
  });

  factory MovieModel.fromJson(Map<String,dynamic> json) => MovieModel(
      id: json["id"],
      title: json["title"],
      backDropPath: json["backdrop_path"],
      genderId: json["genre_ids"].cast<int>(),
      overview: json["overview"],
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"]
  );

}