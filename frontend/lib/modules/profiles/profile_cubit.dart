

import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/layouts/main_page/main_page/cubit_main_page.dart';
import 'package:frontend/modules/profiles/profiles_states.dart';
import 'package:frontend/shared/components/constatnt.dart';
import 'package:frontend/shared/network/local/shared_prefrence.dart';
import 'package:image_picker/image_picker.dart';
import 'package:frontend/shared/network/remote/dio_helper.dart';


class profilecubit extends Cubit<profile_state>{

  profilecubit():super(init_profile_state());

  static profilecubit get(context)=>BlocProvider.of(context);
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
        emit(change_fromgallary_state());
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
        emit(change_fromcamera_state());
    }
  }
  Map<String,dynamic>profile={};
  int begin=0;
  String ?firstname;
  String ?lastname;
  List<dynamic>consultation=[];
  List<dynamic>experience=[];
  void getprofile() async {
    emit(Loading_getprofile_state());
    await dio_helper.getData(
      url: 'myprofile',
      token: 'Bearer ${cache_helper.getData(key:'token')}'
    ).then((value){
      profile= jsonDecode(value.data);
      consultation=profile['expert']['consultations'];
      experience=profile['expert']['experience'];
      begin=profile['is_expert'];
      firstname=profile['first_name'];
      lastname=profile['last_name'];
      emit(Success_getprofile_state());
    } ).catchError((error){
      print(error.toString());
      emit(Error_getprofile_state(error.toString()));
    });
  }


  void updateprofile({
    String ?first_name,
    String ?last_name,
    String ?phone_numbers,
    File   ? image,
    String ?country,
    String ?city,
    String ?street,
})async{
    emit(Loading_Updateprofile_state());
    await dio_helper.putData(url:'update_account',
        data: {
         'first_name':first_name,
          'last_name':last_name,
          'phone_numbers':phone_numbers,
          'image':image,
          'country':country,
          'city':city,
          'street':street,
        },
        token: cache_helper.getData(key:'token'));

  }

  bool is_drop=false;
  void drop_down(){
    is_drop=!is_drop;
    emit(dropdown_state());

  }
  int counter=1;
  void addtext(){
    counter+=1;
    emit(addfiled());
  }
  void removetext(){
    counter-=1;
    emit(removefield());
  }
  List<dynamic>booked_date=[];
  Future get_booked_date()async{
    await dio_helper.getData(
      url:'get_all_booked_dates_for_expert',
        token: 'Bearer ${cache_helper.getData(key:'token')}').then((value){
      booked_date=jsonDecode(value.data);
      print(booked_date);
      emit(Success_getbookeddate_state());
    }).catchError((error){
      print(error.toString());
    });
  }


  Future addConsultation({
  required String Consultation
})async{
    emit(Loading_addConsultation_state());
    return dio_helper.postData(
      token:'Bearer ${cache_helper.getData(key:'token')}' ,
        url: 'expert_add_Consultation',
        data: {
          'name_of_consultations':Consultation
        }
    ).then((value){
      print(value.data);
      Fluttertoast.showToast(
          msg: "Successed Add Consultation",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.pink[700],
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(Success_addConsultation_state());
    }).catchError((error){
      Fluttertoast.showToast(
          msg: "Failed Add Consultation",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.pink[700],
          textColor: Colors.white,
          fontSize: 16.0
      );
       print(error.toString());
       emit(Error_addConsultation_state(error));
    });

  }

  Future RemoveConsultation({
    required String name
  })async{
    emit(Loading_RemoveConsultation_state());
    return dio_helper.postData(
        token:'Bearer ${cache_helper.getData(key:'token')}' ,
        url: 'delete/Consulatation',
        data: {
          'name_of_consultations':name
        }
    ).then((value){
      print(value.data);
      Fluttertoast.showToast(
          msg: "Successed Remove Consultation",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.pink[700],
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(Success_RemoveConsultation_state());
    }).catchError((error){
      print(error.toString());
      Fluttertoast.showToast(
          msg: "Failed Remove Consultation",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[700],
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(Error_RemoveConsultation_state(error));
    });

  }

  Map<String,dynamic>?addexperience;
  Future add_experience({
    required String name_of_experience,
    required String description,
})async{
    emit(Loading_experience_state());
    dio_helper.postData(
        url: 'add_experience',
        token:'Bearer ${cache_helper.getData(key:'token')}' ,
        data: {
          'name_of_experience':name_of_experience,
          'description':description
        }).then((value) {
      addexperience=jsonDecode(value.data);
      Fluttertoast.showToast(
          msg: "add experience Successed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.pink[700],
          textColor: Colors.white,
          fontSize: 16.0
      );
          emit(Success_experience_state());
    }).catchError((error){
      print(error.toString());
      Fluttertoast.showToast(
          msg: "Failed add experience",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[900],
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(Error_experience_state(error.toString()));
    });
  }

  Future Removeexperience({
    required String name_of_experience
  })async{
    emit(Loading_Removeexperience_state());
    return dio_helper.postData(
        token:'Bearer ${cache_helper.getData(key:'token')}' ,
        url: 'delete_experience',
        data: {
          'name_of_experience':name_of_experience
        }
    ).then((value){
      print(value.data);
      Fluttertoast.showToast(
          msg: "Successed Remove experience",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.pink[700],
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(Success_Removeexperience_state());
    }).catchError((error){
      print(error.toString());
      Fluttertoast.showToast(
          msg: "Failed Remove experience",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[700],
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(Error_RemoveConsultation_state(error));
    });

  }


  




}