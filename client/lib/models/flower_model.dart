import 'dart:convert';

// List<FlowerModel> flowersFromJson(dynamic str) =>
//     List<FlowerModel>.from((str).map((e) => FlowerModel.fromJson(e)));

// class FlowerModel {
//   late String? id;
//   late String? family;
//   late String? tribe;
//   late String? kingdom;
//   late String? genus;
//   late String? synonym;
//   late String? bloom;
//   late String? description;
//   late String? imageUrl;

//   FlowerModel({
//     this.id,
//     this.family,
//     this.tribe,
//     this.kingdom,
//     this.genus,
//     this.synonym,
//     this.bloom,
//     this.description,
//     this.imageUrl,
//   });

//   FlowerModel.fromJson(Map<String, String> json) {
//     id = json["id"];
//     family = json["family"];
//     tribe = json["tribe"];
//     kingdom = json["kingdom"];
//     genus = json["genus"];
//     synonym = json["synonym"];
//     bloom = json["bloom"];
//     description = json["description"];
//     imageUrl = json["imageUrl"];
//   }

//   Map<String, dynamic> toJson() {
//     final _dataSet = <String, dynamic>{};

//     _dataSet["_id"] = id;
//     _dataSet["family"] = family;
//     _dataSet["tribe"] = tribe;
//     _dataSet["kingdom"] = kingdom;
//     _dataSet["genus"] = genus;
//     _dataSet["synonym"] = synonym;
//     _dataSet["bloom"] = bloom;
//     _dataSet["description"] = description;
//     _dataSet["imageUrl"] = imageUrl;

//     return _dataSet;
//   }
// }

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
      imageUrl: json["imageUrl"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_family": family,
        "_tribe": tribe,
        "_kingdom": kingdom,
        "_genus": genus,
        // "_synonym": synonym,
        "_bloom": bloom,
        "_description": description,
        "_imageUrl": imageUrl,
      };
}
