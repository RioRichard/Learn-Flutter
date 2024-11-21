import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter/features/daily_news/domain/entites/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? exception;

  const RemoteArticleState({this.articles, this.exception});

  @override
  List<Object?> get props => [articles!, exception!];
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

class RemoteArticleLoaded extends RemoteArticleState {
  const RemoteArticleLoaded(List<ArticleEntity> articles) : super(articles: articles);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException exception) : super(exception: exception);
}
