import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/models/article_do.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleDO? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSaavedArticles extends LocalArticleEvent {
  const GetSaavedArticles();
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(ArticleDO articleDO) : super(article: articleDO);
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(ArticleDO articleDO) : super(article: articleDO);
}
