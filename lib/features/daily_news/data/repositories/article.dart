import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learn_flutter/core/constants/constants.dart';
import 'package:learn_flutter/core/resoureces/data_state.dart';
import 'package:learn_flutter/features/daily_news/data/models/article.dart';
import 'package:learn_flutter/features/daily_news/data/sources/news_api_service.dart';
import 'package:learn_flutter/features/daily_news/domain/repositories/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: apiKey,
        country: country,
        category: category,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          requestOptions: httpResponse.response.requestOptions,
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
