

import 'package:audacity/model/photo_model.dart';
import 'package:audacity/widget/custome_http_request.dart';
import 'package:flutter/material.dart';

class PhotoProvider with ChangeNotifier{

  List<PhotoModel> photoList = [];

  getAllPhotos(context) async {
    photoList = await CustomHttpRequest.getPhoto(context);
    notifyListeners();
  }
}