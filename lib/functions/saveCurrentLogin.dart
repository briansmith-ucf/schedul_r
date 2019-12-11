import 'package:shared_preferences/shared_preferences.dart';
import 'package:schedul_r/models/loginModel.dart';

saveCurrentLogin(Map responseJson) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();


  var user;
  if ((responseJson != null && responseJson.isNotEmpty)) {
    user = LoginModel.fromJson(responseJson).email;
  } else {
    user = "";
  }
  var email = (responseJson != null && responseJson.isNotEmpty) ? LoginModel.fromJson(responseJson).email : "";
  var password = (responseJson != null && responseJson.isNotEmpty) ? LoginModel.fromJson(responseJson).password : "";
  var access_token = (responseJson != null && responseJson.isNotEmpty) ? LoginModel.fromJson(responseJson).access_token : "";

  await preferences.setString('LastUser', (user != null && user.length > 0) ? user : "");
  await preferences.setString('LastEmail', (email != null && email.length > 0) ? email : "");
  await preferences.setString('LastPassword', (password != null && password.length > 0) ? password : "");
  await preferences.setString('Token', (access_token != null && access_token.length > 0) ? access_token : "");
}