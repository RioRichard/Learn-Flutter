import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_flutter/core/utils/format_datetime.dart';
import 'package:learn_flutter/features/daily_news/domain/entites/article.dart';
import 'package:learn_flutter/features/daily_news/presentations/widgets/basic_app_bar.dart';
import 'package:learn_flutter/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNews extends StatelessWidget {
  const DetailNews({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${article.title}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${article.author ?? 'Unknown author'} | ${FormatDatetime.jsonFormatDateTime(jsonDateTime: article.publishedAt ?? '', format: 'dd-MM-yyyy HH:mm')}',
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: Image.network(
                  article.urlToImage ?? '',
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${article.content}',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
