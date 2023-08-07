import 'package:flutter_clean_architecture/core/use_cases/core_use_case.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/domain_repository/article_repository.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/models/article_do.dart';

class GetSavedArticleUseCase implements CoreUseCase<List<ArticleDO>, void> {
  final ArticleRepository _articleRepository;
  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleDO>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
