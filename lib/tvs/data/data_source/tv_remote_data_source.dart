import 'dart:async';

import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
import '../models/tv_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTv();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();
}

class TvRemoteDateSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> getOnTheAirTv() async {
    final response = await Dio().get(ApiConstance.onTheAirPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
        (response.data['results'] as List).map(
          (e) => TvModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getPopularTv() async {
    final response = await Dio().get(ApiConstance.tvPopularPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
        (response.data['results'] as List).map(
          (e) => TvModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async {
    final response = await Dio().get(ApiConstance.tvTopRatedPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
        (response.data['results'] as List).map(
          (e) => TvModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
