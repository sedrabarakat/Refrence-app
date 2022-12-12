import 'package:dio/dio.dart';

class dio_helper{
  static Dio?dio;

  static init(){
    dio=Dio(
        BaseOptions(
            baseUrl: 'http://10.0.2.2:8000/api/',
            responseType: ResponseType.plain,
            receiveDataWhenStatusError: true,
            headers: {
              'Accept':'application/json',
              'Content-Type':'application/json'

            }
        )
    );
  }

  static Future<Response>postData({
    required String url,
    required Map<String,dynamic>data,
    String?token,
    Map<String,dynamic>?query,

  }) async {
    dio!.options.headers={
      'Authorization':token,
    };
    return await dio!.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String,dynamic>?query,
    String?token,
  }) async{
    dio!.options.headers={
      'Authorization':token
    };
    return await dio!.get(url,
        queryParameters: query);

  }
















}