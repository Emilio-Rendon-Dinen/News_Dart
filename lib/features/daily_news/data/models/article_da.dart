import 'package:flutter_clean_architecture/features/daily_news/domain/models/article_do.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleDA extends ArticleDO {
  const ArticleDA({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleDA.fromJson(Map<String, dynamic> map) {
    return ArticleDA(
      id: map['id'] ?? 0,
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }

  factory ArticleDA.fromEntity(ArticleDO entity) {
    return ArticleDA(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }
}
