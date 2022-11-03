import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/useCase/base_usecase.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/use_cases/get_on_the_ait_tv_usecase.dart';
import '../../../domain/use_cases/get_popular_tv_usecase.dart';
import '../../../domain/use_cases/get_top_rated_tv_usecase.dart';
import 'tv_event.dart';
import 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnTheAirTvUseCase getOnTheAirTvUseCase;
  final GetPopularTvUsecase getPopularMoviesUseCase;
   final GetTopRatedTvUseCase getTopRatedTvUsecase;


  TvBloc(this.getOnTheAirTvUseCase,this.getPopularMoviesUseCase,this.getTopRatedTvUsecase) : super(const TvState()) {
    on<GetOnTheAirTvEvent>(_getOnTheAirTvs);
    on<GetPopularTvEvent>(_getPopularTvs); 
    on<GetTopRatedTvEvent>(_getTopRatedTvs);
      }
    
      FutureOr<void> _getOnTheAirTvs(
          GetOnTheAirTvEvent event, Emitter<TvState> emit) async {
        final result = await getOnTheAirTvUseCase(const NoParameters());
    
        result.fold(
          (l) => emit(
            state.copyWith(
            onTheAirState: RequestState.error,
            onTheAirMessage: l.message,
          )),
          (r) => emit(
            state.copyWith(
            onTheAirTvs: r,
            onTheAirState: RequestState.loaded,
          )
          ),
           );
      }
    
    
      FutureOr<void> _getPopularTvs(
          GetPopularTvEvent event, Emitter<TvState> emit) async {
        final result = await getPopularMoviesUseCase(const NoParameters());
    
        result.fold(
          (l) => emit(
            state.copyWith(popularTvState: RequestState.error,popularTvMessage: l.message,
          )),
          (r) => emit(
            state.copyWith(popularTvs: r, popularTvState: RequestState.loaded,
          )
          ),
           );
      }
    
    
    
    

      FutureOr<void> _getTopRatedTvs(GetTopRatedTvEvent event, Emitter<TvState> emit) async{
        final result = await getTopRatedTvUsecase(const NoParameters());    
        result.fold(
        (l) => emit(state.copyWith(topRatedTvMessage: l.message, topRatedTvState: RequestState.error),), 
        (r) => emit(state.copyWith(topRatedTvs: r, topRatedTvState: RequestState.loaded),),
        );  
  }
}
