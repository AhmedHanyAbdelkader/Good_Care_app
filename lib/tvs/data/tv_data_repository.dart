// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/tvs/data/data_source/tv_remote_data_source.dart';
import 'package:movies_app/tvs/domain/entities/tv.dart';
import 'package:movies_app/tvs/domain/repository/base_tv_repository.dart';

class TvDataRepository extends BaseTvRepository {

  TvRemoteDateSource tvRemoteDateSource;
  TvDataRepository(
     this.tvRemoteDateSource,
  );

@override
 Future<Either<Failure, List<Tv>>> getTvOnTheAir()async{
   try{
      final result = await  tvRemoteDateSource.getOnTheAirTv();
      return Right(result);
   }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageModel.statueMessage));
   }
 }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async{
    try{
      final result = await tvRemoteDateSource.getPopularTv();
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statueMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async{
   try{
     final result = await tvRemoteDateSource.getTopRatedTv();
     return Right(result);
   } on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageModel.statueMessage));
   }
  }
  
}
