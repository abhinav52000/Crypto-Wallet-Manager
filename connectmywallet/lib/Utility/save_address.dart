import 'package:shared_preferences/shared_preferences.dart';

String? acceessToken;

// load the value from shared preferences
loadMyValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  acceessToken = (prefs.getString('address'));
  return acceessToken;
}

// save the value to shared preferences
saveMyValue(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  acceessToken = value;
  prefs.setString('address', value);
}
