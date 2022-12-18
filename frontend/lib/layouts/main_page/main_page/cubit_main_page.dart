import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/layouts/main_page/main_page/states_mainpage.dart';

import '../../../models/get_all_expert.dart';
import '../../../modules/favorite.dart';
import '../../../modules/home.dart';
import '../../../modules/profiles/profile.dart';
import 'package:frontend/shared/network/remote/dio_helper.dart';
import 'package:frontend/models/login_model.dart';
import 'package:frontend/modules/profiles/profile.dart';


class cubit extends Cubit<layout_state>{
  cubit():super(init_state());

  static cubit get(context)=>BlocProvider.of(context);
  var index=0;
  bool issecure=true;
  List <Widget>list=[
    favorite(),
    home(),
    profile()
  ];
  loginModel?loginmodel;
  void on_Tap(int value){
    index=value;
    print(index);
    emit(change_index());
  }

  void change_redeye(){
    issecure=!issecure;
    print( issecure);
    emit(change_eyesuffix());
  }
  Future login_post({
    required String email,
    required String password
  })async{
    emit(Loading_login_state());
    await dio_helper.postData(
      url:'login',
      data: {
        'email':email,
        'password':password,
        'device_name': 'win',
      },
    ).then((value){
      loginmodel=loginModel.fromjson(value.data);
      print(loginmodel?.token);
      emit(Success_login_state());
    }).catchError((error){
      print(error.toString());
      emit(Error_login_state(error));
    });
  }
  List<dynamic>?expertlist=[];

  void getexpert() async{
    emit(Loading_getexpert());
    await dio_helper.getData(
      url: 'all_experts',

    ).then((value){
      expertlist= jsonDecode(value.data);
      print(expertlist);
     // print(expertlist![0]['hour_charging']);

      emit(Success_getexpert());
    } ).catchError((error){
      print(error.toString());
      emit(Error_getexpert(error.toString()));
    });
  }

}