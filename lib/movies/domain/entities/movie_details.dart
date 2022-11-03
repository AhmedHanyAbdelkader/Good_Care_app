import 'package:equatable/equatable.dart';

import 'generes.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Generes> generes;
  final int id;
  final String overView;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;

  const MovieDetails({
    required this.backdropPath,
    required this.generes,
    required this.id,
    required this.overView,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        generes,
        id,
        overView,
        releaseDate,
        runTime,
        title,
        voteAverage,
      ];
}
