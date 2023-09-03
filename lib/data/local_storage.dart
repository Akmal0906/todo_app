import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
   saveTask(List<String> list) async* {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? list1= prefs.getStringList('item');
    for (var element in list) {list1!.add(element);}
    prefs.setStringList('item', list1!);

    print('LOCAL-STORAGE : ${prefs.getStringList('item')}');
  }

  void clearTask(List<String> list) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<List<String>?> getTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('item');
  }

  Future<bool> checkTask() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('item')) {
      return true;
    } else {
      return false;
    }
  }
}
