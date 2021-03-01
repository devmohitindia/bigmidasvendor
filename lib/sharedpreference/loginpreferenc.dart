import 'dart:convert';

import 'package:bigmidasvendor/model/modeluser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPreference
{
  String keyUser="user";


  void saveUserPreference(String jsonString)async
  {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    //Map decode_options = jsonDecode(jsonString);
    //ModelUser modelUser=ModelUser.fromJson(decode_options);
    //modelUser.userType=""
    //String user = jsonEncode();
    shared_User.setString(keyUser, jsonString);
  }
  Future<ModelUser> getUserPreference()async
  {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map json = jsonDecode(pref.getString(keyUser));
    ModelUser user = ModelUser.fromJson(json);
    return user;
  }
}