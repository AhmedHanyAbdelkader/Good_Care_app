import '../../domain/entities/movie_details.dart';
import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.generes,
    required super.id,
    required super.overView,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
  });


  factory MovieDetailsModel.fromJson(Map<String, dynamic> json){
    return MovieDetailsModel(
     backdropPath : json['backdrop_path'],
     generes : List<GenresModel>.from(
       json["genres"].map((x)=> GenresModel.fromJson(x))
     ),
     id : json['id'],
     overView : json['overview'], 
     releaseDate : json['release_date'],
     runTime : json['runtime'],   
     title : json['title'],
     voteAverage : json['vote_average'].toDouble(), 
    );
  }

}
