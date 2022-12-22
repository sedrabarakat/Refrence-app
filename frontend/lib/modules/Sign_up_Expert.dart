import 'dart:convert';
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/shared/components/constatnt.dart';
import 'package:frontend/shared/network/remote/dio_helper.dart';
import '../layouts/main_page/main_page/cubit_main_page.dart';
import '../layouts/main_page/main_page/main_page.dart';
import '../layouts/main_page/main_page/states_mainpage.dart';
import 'package:frontend/models/login_model.dart';
import 'package:frontend/shared/network/local/shared_prefrence.dart';

import '../shared/styles/styles.dart';
class Sign_up_Expert extends StatelessWidget {
  var lastnamecontroller = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var firstnameController = TextEditingController();
  var phoneController = TextEditingController();
  var citycontroller = TextEditingController();
  var countrycontroller = TextEditingController();
  var streetcontroller = TextEditingController();
  var hourchargingcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var emailcontroller=TextEditingController();
    var passwordcontroller=TextEditingController();
    var key =GlobalKey<FormState>();
    var scaffoldkey=GlobalKey<ScaffoldState>();

    return BlocConsumer<cubit,layout_state>(
      listener: (context,layout_state){
        if(State is Success_login_state){}
      },
      builder: (context,layout_state){
        bool isSecure=cubit.get(context).issecure;
        bool isOpen=false;
        File?imageFile=cubit.get(context).imageFile;

        //String?token=cubit.get(context).loginmodel?.token;
        return Scaffold(

          key: scaffoldkey,
            backgroundColor:Colors.deepPurple[50],
            body: Form(
              key: key,
              child: SingleChildScrollView(
                child: Column(children: [
                  Stack(
                    children: [
                      Container(
                        height:260, //height/2.8
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            image:const DecorationImage(
                                image: AssetImage('assets/image/well.jpg'),
                                fit: BoxFit.cover
                            )),),
                      Padding(
                        padding:  const EdgeInsets.only(top: 150),
                        child: Center(
                          child: Stack(  //user_image
                              alignment: Alignment.bottomRight,
                              children:[
                                Container(
                                  height:160 ,//height/5.8
                                  width:160 ,// width/2.7
                                  clipBehavior: Clip.hardEdge,
                                  decoration:BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(140),
                                  ),
                                  child: imageFile==null?Image.asset('assets/image/profile.png'
                                    ,fit: BoxFit.scaleDown,
                                  ):
                                  Image.file(
                                    imageFile,
                                    fit: BoxFit.cover,
                                  ),),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(70)
                                  ),
                                  child: IconButton(onPressed: (){
                                    if(isOpen==false){
                                      scaffoldkey.currentState?.showBottomSheet(
                                          backgroundColor: Colors.deepPurple[50],
                                              (context) => Container(
                                              decoration:  BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [Colors.deepPurple.shade300,Colors.deepPurple.shade100,Colors.deepPurple.shade300]
                                                ),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(50),
                                                    topRight: Radius.circular(50)
                                                )
                                            ),
                                            width: double.infinity,height: 80,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(20.0),
                                                  child: IconButton(onPressed: (){
                                                    var fromCamera = cubit.get(context).getFromCamera();
                                                  },
                                                      icon: const Icon(Icons.camera,size: 30,)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(20.0),
                                                  child: IconButton(
                                                      onPressed: (){
                                                        cubit.get(context).getFromGallery();
                                                      },
                                                      icon:Icon(Icons.photo_library,size: 30,)),
                                                )
                                              ],),)).closed.then((value){
                                        isOpen=false;  });
                                      isOpen=true;}
                                    else{
                                      Navigator.pop(context);
                                      isOpen=false;                    }
                                  },
                                      icon: Icon(Icons.cameraswitch,)),
                                )
                              ])
                        ),
                      )
                    ],

                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: msh,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.deepPurpleAccent,
                        controller: firstnameController,
                        validator: (value){
                          if(value==null||value.isEmpty)
                            return 'Please Fill That Field';
                          if(value.length<3)
                            return 'your Name is too Short';
                          if(value.length>30)
                            return 'your Name is too Long';
                          else return null;
                        },
                        decoration: d.copyWith(
                            labelText: 'First Name',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.deepPurpleAccent,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: msh,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.deepPurpleAccent,
                        controller: lastnamecontroller,
                        validator: (value){
                          if(value==null||value.isEmpty)
                            return 'Please Fill That Field';
                          if(value.length<3)
                            return 'Your Last Name is too Short';
                          if(value.length>30)
                            return 'Your Last Name is too Long';
                          else return null;
                        },
                        decoration: d.copyWith(
                            labelText: 'Last name',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.deepPurpleAccent,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: msh,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.deepPurpleAccent,
                        controller: emailController,
                        validator: (value){
                          if(!value!.contains('@')&& !value.contains('.')&& !value.contains('com'))
                            return 'please enter an email address';
                          else if(value==null||value.isEmpty) {
                            return 'this field shouldn\'t be empty';}
                          else {
                            return null;}
                        },
                        decoration: d.copyWith(
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.deepPurpleAccent,
                          ),

                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: msh,
                      child: TextFormField(
                        obscureText: isSecure,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.deepPurpleAccent,
                        controller: passwordController,
                        validator: (value) {
                          if(value==null||value.isEmpty)
                            return 'Please Fill That Field';
                          else if(value.length<8)
                            return 'Password is two short';
                          else
                            return null;
                        },
                        decoration: d.copyWith(
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.deepPurpleAccent,
                          ),
                          suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye,color:Colors.deepPurpleAccent,),
                            onPressed: () {
                              cubit.get(context).change_redeye();
                            },),),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: msh,
                      child: TextFormField(
                        controller:phoneController,
                        validator: (value){
                          if(value==null||value.isEmpty)
                            return 'Please Fill that Field';
                          if(value.length<=9)
                            return 'Your number is too short';
                        },
                        onChanged: (value) {
                        },
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.deepPurpleAccent ,
                        decoration: d.copyWith(
                            labelText: 'Phone',
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.deepPurpleAccent,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,
                  ),
                  const   SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: msh,
                      child: TextFormField(
                        keyboardType: TextInputType.streetAddress,
                        cursorColor: Colors.deepPurpleAccent,
                        controller: countrycontroller,
                        validator: (value) {
                          if(value==null||value.isEmpty)
                            return 'please fill that field';
                          else
                            return null;
                        },
                        decoration: d.copyWith(
                            labelText: 'County',
                            prefixIcon: const Icon(
                              Icons.flag,
                              color: Colors.deepPurple,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: msh,
                      child: TextFormField(
                        keyboardType: TextInputType.streetAddress,
                        cursorColor: Colors.deepPurpleAccent,
                        controller: citycontroller,
                        validator: (value) {
                          if(value==null||value.isEmpty)
                            return 'please fill that field';
                          else
                            return null;
                        },
                        decoration: d.copyWith(
                            labelText: 'City',
                            prefixIcon:const Icon(
                              Icons.location_city,
                              color: Colors.deepPurple,
                            )),
                      ),
                    ),
                  ),
                  const  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: msh,
                      child: TextFormField(
                        keyboardType: TextInputType.streetAddress,
                        cursorColor: Colors.deepPurpleAccent,
                        controller: streetcontroller,
                        validator:(value) {
                          if(value==null||value.isEmpty)
                            return 'please fill that field';
                          else
                            return null;
                        },
                        decoration: d.copyWith(
                            labelText: 'Street',
                            prefixIcon:const Icon(
                              Icons.home_filled,
                              color: Colors.deepPurple,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: msh,
                      child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          cursorColor: Colors.deepPurpleAccent,
                          controller: hourchargingcontroller,
                          validator: (value) {
                            if(value==null||value.isEmpty)
                              return 'please fill that field';
                            if(value==0)
                              return 'put another value please';
                            else
                              return null;

                          },
                          decoration: d.copyWith(
                            prefixIcon: const Icon(
                              Icons.currency_bitcoin_rounded,
                              color: Colors.deepPurple,
                            ),
                            labelText: 'hour charge',
                          )),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                      width: 270,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(210, 170, 148,251 ),
                                blurRadius: 30.0,
                                offset:Offset(0,1)
                            )]
                      ),
                      child: ConditionalBuilder(
                        condition: State is! Loading_login_state ,
                        builder: (context)=>ElevatedButton(
                          onPressed: (){
                          if(key.currentState!.validate()){
                            cubit.get(context).sign_up_expert(
                                name: firstnameController.text,
                                lastname: lastnamecontroller.text,
                                email: emailController.text,
                                password: passwordController.text,
                                country: countrycontroller.text,
                                city: citycontroller.text,
                                phone: phoneController.hashCode,
                                hour: hourchargingcontroller.hashCode,
                                street: streetcontroller.text).then((value){
                              if((cubit.get(context).sign_expert_token)!=null){
                                cache_helper.saveData(key: 'token', value: cubit.get(context).sign_expert_token);
                                token=cubit.get(context).sign_expert_token;
                                print(token);
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context)=>First()));}
                              else{
                                print('need another email');
                              }
                            }).catchError((error){
                              print(error.toString());
                            });
                          }
                        },
                          child:Text('Sign Up',
                            style:TextStyle(fontSize: 16) ,),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            primary: Colors.deepPurpleAccent,
                            elevation: 15,
                          ),),
                        fallback: (context)=>CircularProgressIndicator(strokeWidth: 3,color: Colors.deepPurple,backgroundColor: Colors.purple[300],),
                      )
                  ),
                  const SizedBox(height: 20,),
                ],),
              ),
            )

        );
      }
      ,
    );
  }
}
