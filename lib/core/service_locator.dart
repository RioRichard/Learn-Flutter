import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_flutter/features/daily_news/data/repositories/article.dart';
import 'package:learn_flutter/features/daily_news/data/sources/news_api_service.dart';
import 'package:learn_flutter/features/daily_news/domain/repositories/article.dart';
import 'package:learn_flutter/features/daily_news/domain/use_cases/get_articles.dart';
import 'package:learn_flutter/features/daily_news/presentations/bloc/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  sl.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(sl()));

  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
