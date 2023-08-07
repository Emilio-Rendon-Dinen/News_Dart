import 'package:flutter_clean_architecture/features/daily_news/data/data_repository/article_repository_impl.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/data_sorces/local/app_database.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/data_sorces/remote/news_api_service.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/domain_repository/article_repository.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/use_cases/get_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/use_cases/get_saved_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/use_cases/remove_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/use_cases/save_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDataBase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDataBase>(database);

  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(
    NewsApiService(sl.get()),
  );
  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImplementation(sl(), sl()),
  );

  //Use cases
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl()),
  );

  sl.registerSingleton<GetSavedArticleUseCase>(
    GetSavedArticleUseCase(sl()),
  );

  sl.registerSingleton<SaveArticleUseCase>(
    SaveArticleUseCase(sl()),
  );

  sl.registerSingleton<RemoveArticleUseCase>(
    RemoveArticleUseCase(sl()),
  );

  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(sl()),
  );

  sl.registerFactory<LocalArticleBloc>(
    () => LocalArticleBloc(sl(), sl(), sl()),
  );
}
