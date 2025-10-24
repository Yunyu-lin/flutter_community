import 'package:community_app/utils/api.dart';
import 'package:community_app/utils/https.dart';


Future<dynamic> getAnnouncementIdAPI(String id) => HttpUtils.of.get('${Api.notifyList}/$id');
Future<dynamic> getAnnouncementAPI() => HttpUtils.of.get(Api.notifyList);
Future<dynamic> getSendCodeAPI(params)=>HttpUtils.of.get(Api.SEND_CODE,queryParameters:{'mobile':params});
Future<dynamic> getLoginAPI(phone,code)=>HttpUtils.of.post(Api.LOGIN,data: {'mobile':phone,'code':code});
