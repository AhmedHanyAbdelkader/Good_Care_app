import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../../domain/use_cases/get_movie_details_usecase.dart';
import '../../domain/use_cases/get_recommendation_usecase.dart';
import '../data_source/movie_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository{

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {

   try{
     final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
     return Right(result);
   }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageModel.statueMessage));
   }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try{
      final result = await baseMovieRemoteDataSource.getPopularMovies();
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statueMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try{
      final result = await baseMovieRemoteDataSource.getTopRatedMovies();
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statueMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async{
    try{
      final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statueMessage));
    }
    
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
    try{
      final result = await baseMovieRemoteDataSource.getRecommedation(parameters);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statueMessage));
    }
  }



}