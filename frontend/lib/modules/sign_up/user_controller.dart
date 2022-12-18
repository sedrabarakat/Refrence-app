import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:frontend/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';

class UserController extends GetxController {
  var lastnamecontroller = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var firstnameController = TextEditingController();
  var phoneController = TextEditingController();


/////////////for image

  XFile? selectedimage;

  Widget f() {
    return Container(
      height: 120,
      width: double.infinity,
      child: ListView(
        children: [
          ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () async {
                final XFile? image =
                await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image != null) {
                  selectedimage = image;
                }
              }),
          ListTile(
              leading: Icon(Icons.camera),
              title: Text('Gallery'),
              onTap: () async {
                Get.back();
                final XFile? image =
                await ImagePicker().pickImage(source: ImageSource.camera);

                if (image != null) {
                  selectedimage = image;
                }
              }),
        ],
      ),
    );
  }

////////////////////////////
  var s = Get.arguments;

  nInit() {
    super.onInit();
  }

  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void register() {
    dio_helper.postData(
      url: "http://10.0.2.2:8000/api/singup_normal_user",
      data: {
        "first_name": firstnameController.text,
        "last_name":lastnamecontroller.text ,
        "device_name": 'win',
        "image":selectedimage!.path,
        "email": emailController.text,
        "password": emailController.text,
        "phone_number": phoneController.text,
        "country_number": "963",
      },
    ).then((value) => {
      print(value.data),
    });
  }
/*
  void transport() {
    Get.to(RegisterExpert(), arguments: [
      firstnameController.text,
      lastnamecontroller.text,
      emailController.text,
      passwordController.text,
      phoneController.text,
    ]);
  }*/
}
