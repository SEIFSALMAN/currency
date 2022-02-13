import 'package:dio/dio.dart';

class DioHelper {

  static Dio ?dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://moho.glitch.me/api/',
          receiveDataWhenStatusError: true,
        )
    );
  }
//https://moho.glitch.me/api/convert?from=USD&amount=25&to=EGP
  static  getData({
    String url='convert',
    Map<String, dynamic> ?query,
  }) async {
    return await dio!.get(
        url, queryParameters: query).then((value) {
          print (value.data);
    });
  }
}