import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/models/article_do.dart';

abstract class LocalArticlesState extends Equatable {
  final List<ArticleDO>? articles;

  const LocalArticlesState({this.articles});

  @override
  List<Object> get props => [articles!];
}

class LocalArticlesLoading extends LocalArticlesState {
  const LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticlesState {
  const LocalArticlesDone(List<ArticleDO> articles) : super(articles: articles);
}
