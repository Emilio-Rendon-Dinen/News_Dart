import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/models/article_do.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/screens/article_detail/article_detail.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/screens/home/daily_news.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/screens/saved_articles/saved_articles.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNewsHome());

      case '/ArticleDetails':
        return _materialRoute(ArticleDetailsView(article: settings.arguments as ArticleDO));

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(const DailyNewsHome());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
