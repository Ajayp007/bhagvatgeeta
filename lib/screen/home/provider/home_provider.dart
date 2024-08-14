import 'package:bhagvatgeeta/screen/home/model/home_model.dart';
import 'package:bhagvatgeeta/utils/json_helper/json_helper.dart';
import 'package:flutter/material.dart';

import '../../../utils/shared_pref.dart';

class HomeProvider with ChangeNotifier {
  List<HomeModel> slokList = [];
  String likeSlok = "";
  String? language;
  List<String>? likeSlokList = [];

  Future<void> getJson() async {
    JsonHelper helper = JsonHelper();
    slokList = await helper.slokJson();
    notifyListeners();
  }

  void changeLanguage(String change) {
    language = change;
    notifyListeners();
  }

  Future<void> setSlok() async {
    if (await SharedHelper.helper.getSlok() != null) {
      likeSlok = await SharedHelper.helper.getSlok();
      likeSlokList!.add(likeSlok);
    } else {
      likeSlok = "";
      likeSlokList!.add(likeSlok);
    }
    notifyListeners();
  }

  void deleteLikeSlok(int index) {
    likeSlokList!.removeAt(index);
    notifyListeners();
  }

}
