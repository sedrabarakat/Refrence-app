

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/modules/profiles/profiles_states.dart';
import 'package:image_picker/image_picker.dart';

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




}