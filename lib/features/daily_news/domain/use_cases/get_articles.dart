import 'package:learn_flutter/core/resoureces/data_state.dart';
import 'package:learn_flutter/core/use_cases/use_cases.dart';
import 'package:learn_flutter/features/daily_news/domain/entites/article.dart';
import 'package:learn_flutter/features/daily_news/domain/repositories/article.dart';

class GetArticlesUseCase implements UseCases<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository articleRepository;

  GetArticlesUseCase(this.articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return articleRepository.getArticles();
  }
}
