import 'package:community_app/utils/api_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class tokenManager {
  // 全局唯一实例
  static final tokenManager _instance = tokenManager._();

  // 提供公开访问入口
  static tokenManager get instance => _instance;

  tokenManager._();

  Future<SharedPreferences> _getTokenInstance() {
    return SharedPreferences.getInstance();
  }

  setToken(String token) async {
    final prefs = await _getTokenInstance();
    prefs.setString(GlobalVariable.Token_Key, token);
  }

  Future<String> getToken() async {
    final prefs = await _getTokenInstance();
    return prefs.getString(GlobalVariable.Token_Key) ?? '';
  }

  removeToken() async {
    final prefs = await _getTokenInstance();
    prefs.remove(GlobalVariable.Token_Key);
  }
}
