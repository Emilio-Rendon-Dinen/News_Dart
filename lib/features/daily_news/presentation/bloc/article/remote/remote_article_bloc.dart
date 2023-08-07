import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/resources/data_state.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/use_cases/get_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticlesBloc(this._getArticleUseCase)
      : super(
          const RemoteAerticleLoading(),
        ) {
    on<GetArticlesEvent>(_onGetArticles);
    add(const GetArticlesEvent());
  }

  void _onGetArticles(GetArticlesEvent event, Emitter<RemoteArticleState> emitter) async {
    final dataState = await _getArticleUseCase.call();
    if (dataState is DataSucces && dataState.data!.isNotEmpty) {
      emitter(RemoteArticleSucces(dataState.data!));
    }
    if (dataState is DataError) {
      emitter(RemoteArticleError(dataState.error!));
    }
  }
}
