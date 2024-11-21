import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/core/resoureces/data_state.dart';
import 'package:learn_flutter/features/daily_news/domain/use_cases/get_articles.dart';
import 'package:learn_flutter/features/daily_news/presentations/bloc/remote_article_event.dart';
import 'package:learn_flutter/features/daily_news/presentations/bloc/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticlesUseCase getArticlesUseCase;

  RemoteArticleBloc(this.getArticlesUseCase) : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await getArticlesUseCase.call();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteArticleLoaded(dataState.data!));
    } else {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
