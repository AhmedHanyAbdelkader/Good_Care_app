// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/useCase/base_usecase.dart';
import 'package:movies_app/tvs/domain/entities/tv.dart';
import 'package:movies_app/tvs/domain/repository/base_tv_repository.dart';

class GetPopularTvUsecase extends BaseUseCase<List<Tv>, NoParameters> {
  
  BaseTvRepository baseTvRepository;
  GetPopularTvUsecase(
     this.baseTvRepository,
  );

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async{
    return await baseTvRepository.getPopularTv();
  }

  

  

}
