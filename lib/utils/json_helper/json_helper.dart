import 'dart:convert';

import 'package:bhagvatgeeta/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';

class JsonHelper {
  Future<List<HomeModel>> slokJson() async {
    String slokJson = await rootBundle.loadString('assets/json/slok.json');
    List json = jsonDecode(slokJson);
    List<HomeModel> l1 = json
        .map(
          (e) => HomeModel.mapToModel(e),
        )
        .toList();
    return l1;
  }
}
