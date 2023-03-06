import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

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
    Map<String,dynamic>?data,
    String?token,
    Map<String,dynamic>?query,

  }) async {
    dio!.options.headers={
      'Accept':'application/json',
      'Content-Type':'application/json',
      'Authorization':token,
    };
    return await dio!.post(
      url,//'api/${url}'
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response>postsign({
    required String url,
    required FormData data,
    String?token,
    Map<String,dynamic>?query,

  }) async {
    dio!.options.headers={
      'Accept':'application/json',
      'Content-Type':'application/json',
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
      'Accept':'application/json',
      'Content-Type':'application/json',
      'Authorization': token
    };
    return await dio!.get(url,
        queryParameters: query);

  }

  static Future<Response>putData({
    required String url,
    required Map<String,dynamic>data,
    required String token,
    Map<String,dynamic>?query,
})async{
    dio!.options.headers={
      'Accept':'application/json',
      'Content-Type':'application/json',
      'Authorization': token
    };
    return await dio!.put(url
        ,data: data,
        queryParameters: query);

  }


  static Future<dynamic>deletedata({
    required String url,
    required String token,
    required Map<String,dynamic>data,
})async{
    dio!.options.headers={
      'Accept':'application/json',
      'Content-Type':'application/json',
      'Authorization': token
    };

    return await dio!.delete(url,data: data);
  }

  static Future<Response>delete({
    required String url,
    Map<String,dynamic>?data,
    String?token,
    Map<String,dynamic>?query,
  }) async {
    dio!.options.headers={
      'Accept':'application/json',
      'Content-Type':'application/json',
      'Authorization':token,
    };
    return await dio!.delete(
      url,
      data: data,
      queryParameters: query,
    );
  }



  static Future<Response>getSearch({
    required String url,
    required Map<String,dynamic> query,
    Map<String,dynamic>?data,
   required String token,
  }) async {
    dio!.options.headers={
      'Accept':'application/json',
      'Content-Type':'application/json',
      'Authorization':token,
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }












}