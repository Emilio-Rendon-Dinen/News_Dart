import 'package:flutter_clean_architecture/core/resources/data_state.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/models/article_do.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleDO>>> getNewsArticles();

  //Database methods
  Future<List<ArticleDO>> getSavedArticles();

  Future<void> saveArtice(ArticleDO articleDO);

  Future<void> removeArticle(ArticleDO articleDO);
}
