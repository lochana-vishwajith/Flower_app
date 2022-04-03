import 'dart:convert';


DiaryItem diaryFromJson(String str) => DiaryItem.fromJson(json.decode(str));

String forumToJson(DiaryItem data) => json.encode(data.toJson());

class DiaryItem {
  String id;
  String title;
  String description;
  late String? image;
  String keyword;

  DiaryItem({
    required this.id,
    required this.title,
    required this.description,
    required this.keyword,
  });

  factory DiaryItem.fromJson(Map<String, dynamic> json) => DiaryItem(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    keyword: json["keyword"],
  );
  Map<String, dynamic> toJson() => {
    "_id": id,
    "_title": title,
    "_description": description,
    "_keyword": keyword,
  };
}