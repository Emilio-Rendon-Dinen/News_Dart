import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/models/article_do.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/widgets/article_widget.dart';

class DailyNewsHome extends StatelessWidget {
  const DailyNewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(builder: (_, state) {
      if (state is RemoteAerticleLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is RemoteArticleError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is RemoteArticleSucces) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ArticleWidget(
              article: state.articles![index],
              onArticlePressed: (article) => _onArticlePressed(context, article),
            );
          },
          itemCount: state.articles!.length,
        );
      }
      return Container();
    });
  }

  void _onArticlePressed(BuildContext context, ArticleDO article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
