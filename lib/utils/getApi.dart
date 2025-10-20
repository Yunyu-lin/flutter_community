import 'package:community_app/utils/api.dart';
import 'package:community_app/utils/https.dart';


Future<dynamic> getAnnouncementIdAPI(String id) => HttpUtils.of.get('${Api.notifyList}/$id');
Future<dynamic> getAnnouncementAPI() => HttpUtils.of.get(Api.notifyList);
