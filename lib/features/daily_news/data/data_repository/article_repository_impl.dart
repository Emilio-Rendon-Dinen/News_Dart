import 'dart:io';
import 'package:flutter_clean_architecture/core/constants/constants.dart';
import 'package:flutter_clean_architecture/core/resources/data_state.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/data_sorces/local/app_database.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/data_sorces/remote/news_api_service.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/models/article_da.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/domain_repository/article_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/models/article_do.dart';

class ArticleRepositoryImplementation implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDataBase _appDatabase;
  ArticleRepositoryImplementation(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleDA>>> getNewsArticles() async {
    final httpResponse = await _newsApiService.getNewsArticle(
      apiKey: apiKey,
      country: countryQuery,
      category: categoryQuery,
    );
    try {
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSucces(httpResponse.data);
      } else {
        return DataError(
          DioException(
            error: httpResponse.response,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<List<ArticleDA>> getSavedArticles() async {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleDO articleDO) {
    return _appDatabase.articleDao.deleteArticle(ArticleDA.fromEntity(articleDO));
  }

  @override
  Future<void> saveArtice(ArticleDO articleDO) {
    return _appDatabase.articleDao.insertArticle(ArticleDA.fromEntity(articleDO));
  }
}
