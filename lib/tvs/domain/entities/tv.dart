// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final String? backdropPath; 
  final String posterPath;
  final List<dynamic> genreIds;
  final String firstAirDate;
  final int id;
  final String name;
  final String overView;
  final double popularity;
  final double voteAverage;
  final int voteCoount;
  
  const Tv({
    required this.backdropPath,
    required this.posterPath,
    required this.genreIds,
    required this.firstAirDate,
    required this.id,
    required this.name,
    required this.overView,
    required this.popularity,
    required this.voteAverage,
    required this.voteCoount,
  });

  @override
  List<Object?> get props => [
      backdropPath,
      posterPath,
      genreIds,
      firstAirDate,
      id,
      name,
      overView,
      popularity,
      voteAverage,
      voteCoount,
    ];
  
}
