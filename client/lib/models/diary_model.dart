import 'dart:convert';


DiaryItem diaryFromJson(String str) => DiaryItem.fromJson(json.decode(str));

String forumToJson(DiaryItem data) => json.encode(data.toJson());

class DiaryItem {
  String id;
  String title;
  String description;
  late String? image;

  DiaryItem({
    required this.id,
    required this.title,
    required this.description,
  });

  factory DiaryItem.fromJson(Map<String, dynamic> json) => DiaryItem(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
  );
  Map<String, dynamic> toJson() => {
    "_id": id,
    "_title": title,
    "_description": description,
  };
}