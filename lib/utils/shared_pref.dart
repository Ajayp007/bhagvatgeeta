import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedHelper helper = SharedHelper._();

  SharedHelper._();

  void setThemeData(bool themeData) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setBool('true', themeData);
  }

  Future<bool> getThemeData() async {
    bool? data;

    SharedPreferences shr = await SharedPreferences.getInstance();
    data = shr.getBool('true');
    return data!;
  }

  Future<void> setSlok(String sloks) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setString('slok', sloks);
  }

  Future<String> getSlok() async {
    String? sloks;
    SharedPreferences shr = await SharedPreferences.getInstance();
    sloks = shr.getString('slok')!;
    return sloks;
  }

}
