import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable(nullable: false)
class Article {
  Article();

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'urlToImage')
  String imageUrl;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'publishedAt')
  String publishedAt;

  DateTime get getPublishedAtDate => DateTime.tryParse(publishedAt);

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
