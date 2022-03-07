class FlowerModel {
  late String? family;
  late String? tribe;
  late String? kingdom;
  late String? genus;
  late String? synonym;
  late String? bloom;
  late String? description;
  late String? imageUrl;

  FlowerModel({
    this.family,
    this.tribe,
    this.kingdom,
    this.genus,
    this.synonym,
    this.bloom,
    this.description,
    this.imageUrl,
  });

  FlowerModel.fromJson(Map<String, String> json) {
    family = json["family"];
    tribe = json["tribe"];
    kingdom = json["kingdom"];
    genus = json["genus"];
    synonym = json["synonym"];
    bloom = json["bloom"];
    description = json["description"];
    imageUrl = json["imageUrl"];
  }

  Map<String, dynamic> toJson() {
    final _dataSet = <String, dynamic>{};

    _dataSet["family"] = family;
    _dataSet["tribe"] = tribe;
    _dataSet["kingdom"] = kingdom;
    _dataSet["genus"] = genus;
    _dataSet["synonym"] = synonym;
    _dataSet["bloom"] = bloom;
    _dataSet["description"] = description;
    _dataSet["imageUrl"] = imageUrl;

    return _dataSet;
  }
}
