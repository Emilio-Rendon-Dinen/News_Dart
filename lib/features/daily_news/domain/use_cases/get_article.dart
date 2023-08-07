import 'package:flutter_clean_architecture/core/resources/data_state.dart';
import 'package:flutter_clean_architecture/core/use_cases/core_use_case.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/domain_repository/article_repository.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/models/article_do.dart';

class GetArticleUseCase implements CoreUseCase<DataState<List<ArticleDO>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleDO>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
