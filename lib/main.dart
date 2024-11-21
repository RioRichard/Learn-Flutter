import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learn_flutter/core/service_locator.dart';
import 'package:learn_flutter/features/daily_news/presentations/bloc/remote_article_bloc.dart';
import 'package:learn_flutter/features/daily_news/presentations/bloc/remote_article_event.dart';
import 'package:learn_flutter/features/daily_news/presentations/pages/daily_news.dart';


void main() async {
  await dotenv.load(fileName: '.env');
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: DailyNews()),
    );
  }
}
