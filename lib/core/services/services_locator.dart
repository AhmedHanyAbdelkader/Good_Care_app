import 'package:get_it/get_it.dart';

import '../../movies/data/data_source/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/use_cases/get_movie_details_usecase.dart';
import '../../movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import '../../movies/domain/use_cases/get_popular_movies_use_case.dart';
import '../../movies/domain/use_cases/get_recommendation_usecase.dart';
import '../../movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import '../../movies/presentation/controller/bloc/movie_details_bloc.dart';
import '../../movies/presentation/controller/movies_bloc.dart';
import '../../tvs/data/data_source/tv_remote_data_source.dart';
import '../../tvs/data/tv_data_repository.dart';
import '../../tvs/domain/repository/base_tv_repository.dart';
import '../../tvs/domain/use_cases/get_on_the_ait_tv_usecase.dart';
import '../../tvs/domain/use_cases/get_popular_tv_usecase.dart';
import '../../tvs/domain/use_cases/get_top_rated_tv_usecase.dart';
import '../../tvs/presentation/controller/bloc/tv_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator{
    
    void init(){

      ///Bloc 
      //movie
      sl.registerFactory(()=>MoviesBloc(sl(),sl(),sl()));  
      sl.registerFactory(()=>MovieDetailsBloc(sl(), sl()));  
      //tv
      sl.registerFactory(()=>TvBloc(sl(),sl(),sl()));

      ///Use Case
      //movie
      sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl())); 
      sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl())); 
      sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl())); 
      sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));  
      sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));  
      //tv
      sl.registerLazySingleton(() => GetOnTheAirTvUseCase(sl()));  
      sl.registerLazySingleton(() => GetPopularTvUsecase(sl()));    
      sl.registerLazySingleton(() => GetTopRatedTvUseCase(sl())); 
     
     
      ///Repository
      //movie
      sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
      //tv
       sl.registerLazySingleton<BaseTvRepository>(() => TvDataRepository(sl()));

      ///Data source
      //movie
      sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
      //tv
      sl.registerLazySingleton(() => TvRemoteDateSource());
      sl.registerLazySingleton<BaseTvRemoteDataSource>(() => TvRemoteDateSource());

    }
    
}