import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/tv.dart';

abstract class BaseTvRepository{

  Future<Either<Failure, List<Tv>>> getTvOnTheAir();

  Future<Either<Failure, List<Tv>>> getPopularTv();
  
  Future<Either<Failure, List<Tv>>> getTopRatedTv();
}