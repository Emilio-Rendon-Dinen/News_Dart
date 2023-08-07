import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/data_sorces/local/DAO/aticle_dao.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/models/article_da.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleDA])
abstract class AppDataBase extends FloorDatabase {
  ArticleDao get articleDao;
}
