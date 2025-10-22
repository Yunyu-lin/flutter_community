import 'package:community_app/utils/api_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class tokenManager {
  // 全局唯一实例
  static final tokenManager _instance = tokenManager._();

  // 提供公开访问入口
  static tokenManager get instance => _instance;

  tokenManager._();

  String _token = '';

  Future<SharedPreferences> _getTokenInstance() {
    return SharedPreferences.getInstance();
  }

  init() async {
    final prefs = await _getTokenInstance();
    _token = prefs.getString(GlobalVariable.Token_Key) ?? '';
  }

  setToken(String token) async {
    final prefs = await _getTokenInstance();
    prefs.setString(GlobalVariable.Token_Key, token);
  }

  String getToken() {
    return _token;
  }

  removeToken() async {
    final prefs = await _getTokenInstance();
    prefs.remove(GlobalVariable.Token_Key);
  }
}
