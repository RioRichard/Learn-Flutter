import 'package:json_annotation/json_annotation.dart';
import 'package:learn_flutter/features/daily_news/domain/entites/article.dart';

@JsonSerializable(anyMap: true, includeIfNull: true)
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    var article = ArticleModel(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      content: json['content'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
    return article;
  }
}
