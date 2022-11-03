// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/tvs/domain/entities/tv.dart';

class TvState extends Equatable {
  final List<Tv> onTheAirTvs;
  final RequestState onTheAirState;
  final String onTheAirMessage;
  final List<Tv> popularTvs;
  final RequestState popularTvState;
  final String popularTvMessage;
  final List<Tv> topRatedTvs;
  final RequestState topRatedTvState;
  final String topRatedTvMessage;

  const TvState({
    this.onTheAirTvs = const [],
    this.onTheAirState = RequestState.loading,
    this.onTheAirMessage = '',
    this.popularTvs = const [],
    this.popularTvState = RequestState.loading,
    this.popularTvMessage = '',
    this.topRatedTvs = const [],
    this.topRatedTvState = RequestState.loading,
    this.topRatedTvMessage = '',
      });
  
  TvState copyWith({
      List<Tv>? onTheAirTvs,
      RequestState? onTheAirState,
      String? onTheAirMessage,
      List<Tv>? popularTvs,
      RequestState? popularTvState,
      String? popularTvMessage,

      List<Tv>? topRatedTvs,
      RequestState? topRatedTvState,
      String? topRatedTvMessage,
  }) => TvState(
    onTheAirTvs: onTheAirTvs ?? this.onTheAirTvs,
    onTheAirState: onTheAirState ?? this.onTheAirState,
    onTheAirMessage: onTheAirMessage ?? this.onTheAirMessage,
    popularTvs: popularTvs ?? this.popularTvs,
    popularTvState: popularTvState ?? this.popularTvState,
    popularTvMessage: popularTvMessage ?? this.popularTvMessage,

    topRatedTvs: topRatedTvs ?? this.topRatedTvs,
    topRatedTvState: topRatedTvState ?? this.topRatedTvState,
    topRatedTvMessage: topRatedTvMessage ?? this.topRatedTvMessage,
  );
  

  @override
  List<Object> get props {
    return [
      onTheAirTvs,
      onTheAirState,
      onTheAirMessage,
      popularTvs,
      popularTvState,
      popularTvMessage,
      topRatedTvs,
      topRatedTvState,
      topRatedTvMessage,
    ];
  }
}


