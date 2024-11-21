import 'package:learn_flutter/core/resoureces/data_state.dart';
import 'package:learn_flutter/features/daily_news/domain/entites/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getArticles();
}
