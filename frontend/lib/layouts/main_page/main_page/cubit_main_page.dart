import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/layouts/main_page/main_page/states_mainpage.dart';
import 'package:frontend/modules/search.dart';
import 'package:frontend/shared/network/local/shared_prefrence.dart';
import 'package:image_picker/image_picker.dart';
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
    profile(),
    Search()
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
      Fluttertoast.showToast(
          msg: "Please Check your Email or Password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[900],
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(Error_login_state(error));
    });
  }
  String?sign_expert_token;
  List<dynamic>?sign;
  Dio dio = new Dio();
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
    var Image,
})async{
    emit(Loading_sign_state());
    return await dio_helper.postsign(
        url:'singup_expert',
        data:await FormData.fromMap({"first_name":name,
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
          'image': await MultipartFile.fromFile(imageFile!.path, filename:imageFile!.path.split('/').last),})
    ).then((value){
      sign=jsonDecode(value.data);
      print(sign);
      sign_expert_token=sign![1];
      //print(sign_token);
     // expertmodel=jsonDecode(value.data[0]);
      emit(Success_sign_state());
    }).catchError((error){
      print(error.toString());
      Fluttertoast.showToast(
          msg: "The email has already been taken",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[900],
          textColor: Colors.white,
          fontSize: 16.0
      );
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
    return await dio_helper.postsign(
        url:'singup_normal_user',
        data: FormData.fromMap({
          'first_name':name,
          'last_name':lastname,
          'email':email,
          'password':password,
          'phone_number':phone,
          'device_name': 'win',
          'country_number':963,
          'image': await MultipartFile.fromFile(imageFile!.path, filename:imageFile!.path.split('/').last)
        })).then((value){
      signuser=jsonDecode(value.data);
      print(signuser);
      sign_user_token=signuser![1];
      //print(sign_token);
      // expertmodel=jsonDecode(value.data[0]);
      emit(Success_sign_state());
    }).catchError((error){
      print(error.toString());
      Fluttertoast.showToast(
          msg: "The email has already been taken",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[900],
          textColor: Colors.white,
          fontSize: 16.0
      );
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

  /*Future uploadImage(File) async {
    String fileName = File.path.split('/').last;
    FormData imageData = FormData.fromMap({
      "image": await MultipartFile.fromFile(File.path, filename:File.path.split('/').last),
    });
        emit(upload_image_state());
        return imageData;
  }*/

  List<dynamic>Consultationlist=[];
  Future Consultation_search({
  required String Consultation_name
})async{
    emit(Loading_Consultationsearch_state());
    return await dio_helper.getSearch(
        url:'consultations/find',
        query: {
          'name_of_consultations':Consultation_name
        },
        token: 'Bearer ${cache_helper.getData(key:'token')}'
    ).then((value){
      Consultationlist=jsonDecode(value.data);
      print(Consultationlist);
      //getexpert_byConsultation_id(id:Consultationlist[0]['id_of_consultations']);
      emit(Success_Consultationsearch_state());
    }).catchError((error){
      print(error.toString());
      emit(Error_Consultationsearch_state(error));
    });}

  List<dynamic>searchexpertlist=[];
  Future expert_search({
    required String expert_name
  })async{
    emit(Loading_Consultationsearch_state());
    return await dio_helper.getSearch(
        url:'experts/find',
        query: {
          'name':expert_name
        },
        token: 'Bearer ${cache_helper.getData(key:'token')}'
    ).then((value){
      searchexpertlist=jsonDecode(value.data);
      print(searchexpertlist);
      emit(Success_Consultationsearch_state());
    }).catchError((error){
      print(error.toString());
      emit(Error_Consultationsearch_state(error));
    });}


  Future search({
    required String url,
    required String name
  })async{
    emit(Loading_Search_state());
    return await dio_helper.getSearch(
        url:'${url}',
        query: {
          'name':name
        },
        token: 'Bearer ${cache_helper.getData(key:'token')}'
    ).then((value){
      Consultationlist=jsonDecode(value.data);
      print(Consultationlist);
      emit(Success_Search_state());
    }).catchError((error){
      print(error.toString());
      emit(Error_Search_state(error));
    });}

  List<dynamic>expert_list_id=[];

  Future getexpert_byConsultation_id({
  required int id
})async{
    emit(Loading_id_state());
    return await dio_helper.getData(url:'get_experts_by_id_of_consultations',
        query: {
      'id_of_consultations':'${id}'
        },
        token: 'Bearer ${cache_helper.getData(key:'token')}'
    ).then((value){
      expert_list_id=jsonDecode(value.data);
      print(expert_list_id);
      emit(Success_id_state());
    }).catchError((error){
      print(error.toString());
      emit(Error_id_state(error));
    });
  }
  
var color1=false;
  var color2=false;
void change_color1(){
  color1=!color1;
 if(color2==true){
   color2=false;
 }
  emit(changecolor_state());
}
  void change_color2(){
    color2=!color2;
    if(color1==true){
      color1=false;
    }
    emit(changecolor_state());
  }

  List<dynamic>fav=[];
  Future myfav()async{
  emit(Loading_fav_state());
  return await dio_helper.getData(url: 'favorite/myFavorite',
  token: 'Bearer ${cache_helper.getData(key:'token')}'
  ).then((value){
    fav=jsonDecode(value.data);
    emit(Success_fav_state());
  }).catchError((error){
     print(error.toString());
    emit(Error_fav_state(error.toString()));
  });

  }
  
  List<dynamic>all_consultation=[];
  Future allconsultation()async{
    emit(Loading_allconsultation_state());
    return await dio_helper.getData(url: 'consulatations/index').then((value){
      all_consultation=jsonDecode(value.data);
      print(all_consultation);
      emit(Success_allconsultation_state());
    }).catchError((error){
      print(error.toString());
      emit(Error_allconsultation_state(error.toString()));
    });
  }


  


}