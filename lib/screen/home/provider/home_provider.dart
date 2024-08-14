import 'package:bhagvatgeeta/screen/home/model/home_model.dart';
import 'package:bhagvatgeeta/utils/json_helper/json_helper.dart';
import 'package:flutter/material.dart';

import '../../../utils/shared_pref.dart';

class HomeProvider with ChangeNotifier {
  List<HomeModel> slokList = [];
  String? language;
  List<String> likeSlokList = [];

  Future<void> getJson() async {
    JsonHelper helper = JsonHelper();
    slokList = await helper.slokJson();
    notifyListeners();
  }

  void changeLanguage(String change) {
    language = change;
    notifyListeners();
  }

  Future<void> setSlok(String likeSlok) async {
    List<String> l1 =  await SharedHelper.helper.getSlok();
    if (l1.isNotEmpty) {
      l1.add(likeSlok);
      SharedHelper.helper.setSlok(l1);
    } else {
      SharedHelper.helper.setSlok([likeSlok]);
    }

    getSlok();
    notifyListeners();
  }

  Future<void> getSlok() async {
    List<String> data = await SharedHelper.helper.getSlok();
    if (data.isNotEmpty) {
      likeSlokList = data;
    }
    notifyListeners();
  }

  void deleteLikeSlok(int index) {
    likeSlokList.removeAt(index);
    SharedHelper.helper.setSlok(likeSlokList);
    notifyListeners();
  }
}
