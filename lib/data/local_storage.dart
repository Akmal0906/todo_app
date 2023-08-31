

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
 void saveTask(List<String> list)async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setStringList('item', list);

   print('LOCAL-STORAGE : ${prefs.getStringList('item')}');


 }
 void clearTask(List<String> list)async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.clear();


 }
 Future<List<String>?> getTasks()async{

   final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('item');


 }
 Future<bool> checkTask()async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   if(prefs.containsKey('item')){
     return true;
   }else{
     return false;
   }


 }
}