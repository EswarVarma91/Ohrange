import 'package:dio/dio.dart';

class Config{

static String basicurl = "https://ohrange.in/";
static String services = basicurl+ "service.php";









  static var uri = basicurl;
  static BaseOptions options = BaseOptions(
      baseUrl: uri,
      responseType: ResponseType.plain,
      connectTimeout: 60000,
      receiveTimeout: 90000,
      validateStatus: (code) {
        if (code >= 200) {
          return true;
        }
        return null;
      });

}
