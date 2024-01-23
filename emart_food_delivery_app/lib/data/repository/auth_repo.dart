import 'package:emart_food_delivery_app/data/api/api_client.dart';
import 'package:emart_food_delivery_app/models/signup_body_model.dart';
import 'package:emart_food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  Future<String> getUserToken() async {
    // ignore: await_only_futures
    return await sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }

  bool userLoggedIn() {
    // ignore: await_only_futures
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<Response> login(String email, String password, String phone) async {
    return await apiClient.postData(AppConstants.LOGIN_URI, {"email": email, "password": password, "phone": phone});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  bool clearSharedData(){
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }
  
}