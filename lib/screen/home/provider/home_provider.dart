import 'package:bhagvatgeeta/screen/home/model/home_model.dart';
import 'package:bhagvatgeeta/utils/json_helper/json_helper.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  List<HomeModel> slokList = [];

  Future<void> getJson() async {
    JsonHelper helper = JsonHelper();
    slokList = await helper.slokJson();
    notifyListeners();
  }
}
