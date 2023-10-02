import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  Future<void> saveNumber(int number) async {
    SharedPreferences pref = await prefs;
    pref.setInt('number', number);
  }

  Future<int?> getNumber() async {
    SharedPreferences pref = await prefs;
    return pref.getInt('number');
  }

  Future<void> saveName(String name) async {
    SharedPreferences pref = await prefs;
    pref.setString('name', name);
  }

  Future<String?> getName() async {
    SharedPreferences pref = await prefs;
    return pref.getString('name');
  }
  Future<void> saveAge(String age) async {
    SharedPreferences pref = await prefs;
    pref.setString('age', age);
  }

  Future<String?> getAge() async {
    SharedPreferences pref = await prefs;
    return pref.getString('age');
  }
}

