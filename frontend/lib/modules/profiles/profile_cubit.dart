

import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void getprofile() async {
    emit(Loading_getprofile_state());
    await dio_helper.getData(
      url: 'myprofile',
      token: 'Bearer ${cache_helper.getData(key:'token')}'
    ).then((value){
      profile= jsonDecode(value.data);
      begin=profile['is_expert'];
      firstname=profile['first_name'];
      lastname=profile['last_name'];
      print(firstname);
      print(lastname);
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




}