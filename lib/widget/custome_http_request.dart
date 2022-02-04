import 'dart:convert';

import 'package:audacity/model/photo_model.dart';
import 'package:http/http.dart' as http;

class CustomHttpRequest {



  static Future<dynamic> getPhoto(context) async {
    PhotoModel? photoModel;
    List<PhotoModel> photoList = [];
    try {
      String url = "https://picsum.photos/v2/list?page=2&limit=100";
      var response = await http.get(Uri.parse(url));
      print("Responce issss $response");
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        for (var i in item) {
          photoModel = PhotoModel.fromJson(i);
          photoList.add(photoModel);
        }
      } else {
        print('Data not found');
      }
    } catch (e) {
      print(e);
    }
    return photoList;
  }
}
