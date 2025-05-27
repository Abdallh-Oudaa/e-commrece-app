import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
 static void setData(String key,String? value)async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString(key, value??"");
  }


 static Future<String?> getData(String key)async{
   final SharedPreferences prefs=await SharedPreferences.getInstance();
   return prefs.getString(key);
  }
  static removeKey(String key)async{
   final SharedPreferences prefs=await SharedPreferences.getInstance();
   return prefs.remove(key);
  }
}