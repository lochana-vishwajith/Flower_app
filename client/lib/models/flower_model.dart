import 'dart:convert';

FlowerModel flowerFromJson(String str) =>
    FlowerModel.fromJson(json.decode(str));

String flowerToJson(FlowerModel data) => json.encode(data.toJson());

class FlowerModel {
  late String? id;
  late String? family;
  late String? tribe;
  late String? kingdom;
  late String? genus;
  // late String? synonym;
  late String? bloom;
  late String? description;
  late String? imageUrl;

  FlowerModel({
    required this.id,
    required this.family,
    required this.tribe,
    required this.kingdom,
    required this.genus,
    // required this.synonym,
    required this.bloom,
    required this.description,
    this.imageUrl,
  });

  factory FlowerModel.fromJson(Map<String, dynamic> json) => FlowerModel(
      id: json["_id"],
      family: json["family"],
      tribe: json["tribe"],
      kingdom: json["kingdom"],
      genus: json["genus"],
      // synonym: json["synonym"],
      bloom: json["bloom"],
      description: json["description"],
      imageUrl: json["imageURL"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_family": family,
        "_tribe": tribe,
        "_kingdom": kingdom,
        "_genus": genus,
        // "_synonym": synonym,
        "_bloom": bloom,
        "_description": description,
        "_imageURL": imageUrl,
      };
}
