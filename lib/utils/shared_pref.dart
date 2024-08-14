import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedHelper helper = SharedHelper._();

  SharedHelper._();

  void setThemeData(bool themeData) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setBool('true', themeData);
  }

  Future<bool?> getThemeData() async {
    bool? data;
    SharedPreferences shr = await SharedPreferences.getInstance();
    data = shr.getBool('true');
    return data;
  }

  Future<void> setSlok(List<String> sloks) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('slok', sloks);
  }

Future<List<String>> getSlok() async {
    List<String>? sloks;
    SharedPreferences shr = await SharedPreferences.getInstance();
    sloks = shr.getStringList('slok')??[];
    return sloks;
  }

}