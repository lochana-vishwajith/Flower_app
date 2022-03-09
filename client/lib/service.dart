import 'dart:convert';

import 'package:client/config.dart';
import 'package:client/models/flower_model.dart';
import 'package:http/http.dart' as http;

class Service {
  static var client = http.Client();

  static Future<List<FlowerModel>?> getFlowers() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.flowerUrl);

    // var link = Uri.http(http://localhost:5000/flower/,);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);

      return flowersFromJson(data["data"]);
    } else {
      return null;
    }
  }

  static Future<bool> saveFlower(
    FlowerModel model,
    bool isEditMode,
    bool isImageSelected,
  ) async {
    var flowerURL = Config.flowerUrl;

    if (isEditMode) {
      flowerURL = flowerURL + "/" + model.id.toString();
    }
    var url = Uri.http(Config.apiUrl, flowerURL);

    var requestMethod = isEditMode ? "PUT" : "POST";

    var request = http.MultipartRequest(requestMethod, url);

    request.fields["kingdom"] = model.kingdom!;
    request.fields["family"] = model.family!;
    request.fields["genus"] = model.genus!;
    request.fields["tribe"] = model.tribe!;
    request.fields["bloom"] = model.bloom!;
    request.fields["synonyms"] = model.synonym!;
    request.fields["description"] = model.description!;
    //request.fields["imageURL"] = model.imageUrl!;

    if (model.imageUrl != null && isImageSelected) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'imageURL',
        model.imageUrl!,
      );

      request.files.add(multipartFile);
    }

    print(request.fields);
    print(request.files);
    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteFlower(flowerID) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.flowerUrl + "/" + flowerID);

    var response = await client.delete(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
