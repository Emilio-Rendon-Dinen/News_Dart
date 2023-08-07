import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/models/article_da.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleDA article);

  @delete
  Future<void> deleteArticle(ArticleDA articleDA);

  @Query('SELECT * FROM article')
  Future<List<ArticleDA>> getArticles();
}
