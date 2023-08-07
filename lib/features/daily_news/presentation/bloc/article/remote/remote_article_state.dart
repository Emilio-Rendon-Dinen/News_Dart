import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/models/article_do.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleDO>? articles;
  final DioException? dioException;

  const RemoteArticleState({this.articles, this.dioException});
  @override
  List<Object> get props => [articles!, dioException!];
}

class RemoteAerticleLoading extends RemoteArticleState {
  const RemoteAerticleLoading();
}

class RemoteArticleSucces extends RemoteArticleState {
  const RemoteArticleSucces(List<ArticleDO> article) : super(articles: article);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException dioException) : super(dioException: dioException);
}


//FROM SERVER