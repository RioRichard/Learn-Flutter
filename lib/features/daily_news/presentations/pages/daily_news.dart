import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/features/daily_news/presentations/bloc/remote_article_bloc.dart';
import 'package:learn_flutter/features/daily_news/presentations/bloc/remote_article_state.dart';
import 'package:learn_flutter/features/daily_news/presentations/pages/detail_news.dart';
import 'package:learn_flutter/features/daily_news/presentations/widgets/basic_app_bar.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const BasicAppBar(), body: _listDailyNews());
  }

  BlocBuilder<RemoteArticleBloc, RemoteArticleState> _listDailyNews() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(builder: (_, state) {
      if (state is RemoteArticleLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is RemoteArticleError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is RemoteArticleLoaded) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailNews(
                              article: state.articles![index],
                            )));
              },
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(border: Border.all(color: Colors.black.withOpacity(0.10)), borderRadius: BorderRadius.circular(10)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      child: SizedBox(
                        // height: 100,
                        width: 100,
                        child: Image.network(
                          state.articles![index].urlToImage ?? '',
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        '${state.articles![index].title}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                      Text(
                        '${state.articles![index].description}',
                        maxLines: 3,
                      ),
                      Row(
                        children: [const Icon(Icons.date_range), Text('${state.articles![index].publishedAt}')],
                      ),
                    ]))
                  ])),
            );
          },
          itemCount: state.articles?.length,
        );
      }
      return const SizedBox();
    });
  }
}
