import 'dart:convert';

ForumItem forumFromJson(String str) => ForumItem.fromJson(json.decode(str));

String forumToJson(ForumItem data) => json.encode(data.toJson());

class ForumItem {
  String id;
  String question;
  String description;

  ForumItem({
    required this.id,
    required this.question,
    required this.description,
  });

  factory ForumItem.fromJson(Map<String, dynamic> json) => ForumItem(
        id: json["_id"],
        question: json["question"],
        description: json["description"],
      );
  Map<String, dynamic> toJson() => {
        "_id": id,
        "_question": question,
        "_description": description,
      };
}
