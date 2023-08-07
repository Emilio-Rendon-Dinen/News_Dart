import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/use_cases/get_saved_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/use_cases/remove_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/use_cases/save_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase, this._saveArticleUseCase, this._removeArticleUseCase) : super(const LocalArticlesLoading()) {
    on<GetSaavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(GetSaavedArticles event, Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(RemoveArticle removeArticle, Emitter<LocalArticlesState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(SaveArticle saveArticle, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
