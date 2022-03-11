class ForumItem {
  late String? id;
  late String? question;
  late String? description;
  late String? image;

  ForumItem({
    this.question,
    this.description,
    this.image,
  });

  ForumItem.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    question = json["question"];
    description = json["description"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data["_id"] = id;
    _data["question"] = question;
    _data["description"] = description;
    _data["image"] = image;

    return _data;
  }
}
