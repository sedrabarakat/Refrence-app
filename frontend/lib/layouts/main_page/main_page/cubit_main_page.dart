import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/layouts/main_page/main_page/states_mainpage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/expertclass.dart';
import 'package:frontend/shared/network/local/shared_prefrence.dart';
import '../../../modules/favorite.dart';
import '../../../modules/home.dart';
import '../../../modules/profiles/profile.dart';
import 'package:frontend/shared/network/remote/dio_helper.dart';
import 'package:frontend/models/login_model.dart';



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
    print(issecure);
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
  String?sign_expert_token;
  List<dynamic>?sign;
  Future sign_up_expert({
    required String name,
    required String lastname,
    required String email,
    required String password,
    required String country,
    required String city,
    required String street,
    required int phone,
    required int hour,
})async{
    emit(Loading_sign_state());
    return await dio_helper.postData(
        url:'singup_expert',
        data: {
      'first_name':name,
      'last_name':lastname,
      'email':email,
      'password':password,
      'phone_number':phone,
      'device_name': 'win',
      'country': country,
      'city':city,
      'street':street,
      'country_number':963,
      'hour_charging': hour,
    }).then((value){
      sign=jsonDecode(value.data);
      print(sign);
      sign_expert_token=sign![1];
      //print(sign_token);
     // expertmodel=jsonDecode(value.data[0]);
      emit(Success_sign_state());
    }).catchError((error){
      print(error.toString());
      emit(Error_sign_state(error.toString()));
    });
  }
  String?sign_user_token;
  List<dynamic>?signuser;
  Future sign_up_user({
    required String name,
    required String lastname,
    required String email,
    required String password,
    int ? phone,
  })async{
    emit(Loading_sign_state());
    return await dio_helper.postData(
        url:'singup_normal_user',
        data: {
          'first_name':name,
          'last_name':lastname,
          'email':email,
          'password':password,
          'phone_number':phone,
          'device_name': 'win',
          'country_number':963,
        }).then((value){
      signuser=jsonDecode(value.data);
      print(signuser);
      sign_user_token=signuser![1];
      //print(sign_token);
      // expertmodel=jsonDecode(value.data[0]);
      emit(Success_sign_state());
    }).catchError((error){
      print(error.toString());
      emit(Error_sign_state(error.toString()));
    });
  }
  List<dynamic>?expertlist=[];

  void getexpert() async{
    emit(Loading_getexpert());
    await dio_helper.getData(
      url: 'all_experts',

    ).then((value){
      expertlist= jsonDecode(value.data);
      //print(expertlist);
     // print(expertlist![0]['hour_charging']);

      emit(Success_getexpert());
    } ).catchError((error){
      print(error.toString());
      emit(Error_getexpert(error.toString()));
    });
  }

   File ?imageFile;
  /// Get from gallery
  getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      emit(change_fromcamera_state());
    }
  }
  /// Get from Camera
  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      emit(change_fromgallery_state());
    }
  }




}