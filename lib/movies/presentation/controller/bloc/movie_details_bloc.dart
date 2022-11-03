import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/use_cases/get_movie_details_usecase.dart';
import '../../../domain/use_cases/get_recommendation_usecase.dart';
import 'movie_details_state.dart';

part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommende);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
        final result =await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
        result.fold(
          (l) => emit(state.copyWith(movieDetailsState: RequestState.error, movieDetailsMessage: l.message)),
          (r) => emit(state.copyWith(movieDetails: r, movieDetailsState: RequestState.loaded)), 
           );
      }

  FutureOr<void> _getRecommende(GetMovieRecommendationEvent event,Emitter<MovieDetailsState> emit) async {
      
        final result = await getRecommendationUseCase(RecommendationParameters(event.id));
        result.fold(
          (l) => emit(state.copyWith(recommendationState: RequestState.error, recommendationMessage: l.message)),
          (r) => emit(state.copyWith(recommendation: r, movieDetailsState: RequestState.loaded)), 
           );

      }
}
