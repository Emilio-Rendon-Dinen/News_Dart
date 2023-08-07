import 'package:flutter_clean_architecture/core/use_cases/core_use_case.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/domain_repository/article_repository.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/models/article_do.dart';

class RemoveArticleUseCase implements CoreUseCase<void, ArticleDO> {
  final ArticleRepository _articleRepository;
  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleDO? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
