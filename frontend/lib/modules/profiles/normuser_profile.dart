import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/layouts/main_page/main_page/cubit_main_page.dart';
import 'package:frontend/modules/login.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/profiles/profiles_states.dart';
import 'package:frontend/shared/network/local/shared_prefrence.dart';
import 'package:get/get.dart';

import '../../layouts/main_page/main_page/states_mainpage.dart';
import '../../shared/components/components.dart';


Widget User_profile(myprofile){

    var scaffoldkey= GlobalKey<ScaffoldState>();
    var first_namecontroller=TextEditingController();
    var last_namecontroller=TextEditingController();
    var phonecontroller=TextEditingController();
    var walletcontroller=TextEditingController();
    var passwordcontroller=TextEditingController();
    var emailcontroller=TextEditingController();
    var key=GlobalKey<FormState>();
    var key1=GlobalKey<ScaffoldState>();

    return BlocConsumer<profilecubit,profile_state>(
      listener: (context,profile_state){},
      builder: (context,profile_state){
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        bool isOpen=false;
        File? imageFile=profilecubit.get(context).imageFile;
        if(myprofile.length>0){
          phonecontroller.text=(myprofile['phone_numbers'][0]['phone_number']).toString(); //here
          walletcontroller.text=myprofile['wallet'].toString();
          first_namecontroller.text=myprofile['first_name'].toString();
          last_namecontroller.text=myprofile['last_name'].toString();
        }

        return ConditionalBuilder(
          condition: State is !Loading_getprofile_state,
          builder: (context)=>Scaffold(
            key: scaffoldkey,
            backgroundColor: Colors.grey[200],
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/image/conntact.jpg'),
                      )),),
                SingleChildScrollView(
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 185,),  //background_container
                      child: Stack(alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: height*1.1,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[100],
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40)
                              ),
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:60 ,horizontal:10 ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10,),

                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Expanded(
                                    child:Text('${myprofile['first_name'].toString()} ${ last_namecontroller.text=myprofile['last_name'].toString()}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),),
                                const SizedBox(height: 15,),
                                Container(
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          //(210, 170, 148,251 )
                                            color: Color.fromARGB(210, 150, 140,251 ),
                                            blurRadius: 24.0,
                                            offset:Offset(0,8)
                                        ),]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: (value){},
                                      keyboardType: TextInputType.text,
                                      controller: first_namecontroller,
                                      cursorColor: Colors.deepPurpleAccent ,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[100],
                                        prefixIcon: const Icon(Icons.person,color:Colors.deepPurpleAccent ,),
                                        labelText: 'first name',
                                        labelStyle: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400
                                        ),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.deepPurple),
                                          borderRadius: BorderRadius.circular(50),),
                                        enabledBorder: OutlineInputBorder(borderSide:const BorderSide(
                                          color: Colors.white,),
                                            borderRadius: BorderRadius.circular(50)
                                        ),

                                      ),
                                      validator: (value){
                                        if(value==null||value.isEmpty) {
                                          return 'this field shouldn\'t be empty';}
                                        else {
                                          return null;}
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Container(
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          //(210, 170, 148,251 )
                                            color: Color.fromARGB(210, 150, 140,251 ),
                                            blurRadius: 24.0,
                                            offset:Offset(0,8)
                                        ),]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: (value){},
                                      keyboardType: TextInputType.text,
                                      controller: last_namecontroller,
                                      cursorColor: Colors.deepPurpleAccent ,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[100],
                                        prefixIcon: const Icon(Icons.person,color:Colors.deepPurpleAccent ,),
                                        labelText: 'last name',
                                        labelStyle: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400
                                        ),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.deepPurple),
                                          borderRadius: BorderRadius.circular(50),),
                                        enabledBorder: OutlineInputBorder(borderSide:const BorderSide(
                                          color: Colors.white,),
                                            borderRadius: BorderRadius.circular(50)
                                        ),

                                      ),
                                      validator: (value){
                                        if(value==null||value.isEmpty) {
                                          return 'this field shouldn\'t be empty';}
                                        else {
                                          return null;}
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Container(
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          //(210, 170, 148,251 )
                                            color: Color.fromARGB(210, 150, 140,251 ),
                                            blurRadius: 24.0,
                                            offset:Offset(0,8)
                                        ),]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: (value){},
                                      keyboardType: TextInputType.phone,
                                      controller: phonecontroller,
                                      cursorColor: Colors.deepPurpleAccent ,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[100],
                                        prefixIcon: const Icon(Icons.phone,color:Colors.deepPurpleAccent ,),
                                        labelText: 'phone number',
                                        labelStyle: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400
                                        ),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.deepPurple),
                                          borderRadius: BorderRadius.circular(50),),
                                        enabledBorder: OutlineInputBorder(borderSide:const BorderSide(
                                          color: Colors.white,),
                                            borderRadius: BorderRadius.circular(50)
                                        ),

                                      ),
                                      validator: (value){
                                        if(value==null||value.isEmpty) {
                                          return 'this field shouldn\'t be empty';}
                                        else {
                                          return null;}
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Container(
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          //(210, 170, 148,251 )
                                            color: Color.fromARGB(210, 150, 140,251 ),
                                            blurRadius: 24.0,
                                            offset:Offset(0,8)
                                        ),]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      readOnly: true,
                                      onChanged: (value){},
                                      keyboardType: TextInputType.number,
                                      controller: walletcontroller,
                                      cursorColor: Colors.deepPurpleAccent ,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[100],
                                        prefixIcon: const Icon(Icons.wallet,color:Colors.deepPurpleAccent ,),
                                        labelText: 'Wallet',
                                        labelStyle: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400
                                        ),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.deepPurple),
                                          borderRadius: BorderRadius.circular(50),),
                                        enabledBorder: OutlineInputBorder(borderSide:const BorderSide(
                                          color: Colors.white,),
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                      ),),

                                  ),
                                ),/*
                                const SizedBox(height: 15,),
                                Container(
                                  width: 200,
                                  child: ElevatedButton(onPressed: (){
                                    profilecubit.get(context).updateprofile(
                                      image: imageFile,
                                      first_name: first_namecontroller.text,
                                      last_name:last_namecontroller.text ,
                                      phone_numbers: phonecontroller.text,

                                    );
                                  },
                                      child:Text('Update Profile',
                                        style:TextStyle(fontSize: 16) ,),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                        primary: Colors.deepPurple[500],
                                        elevation: 15,
                                      )),
                                ),
                                */
                                const SizedBox(height: 10,),
                                Container(
                                  width: 200,
                                  child: ElevatedButton(onPressed: (){
                                    if(isOpen==false){
                                      scaffoldkey.currentState?.showBottomSheet(
                                          backgroundColor: Colors.deepPurple[100],
                                              (context) => Container(
                                              decoration:  BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [Colors.deepPurple.shade300,Colors.deepPurple.shade200,Colors.deepPurple.shade300]
                                                  ),
                                                  borderRadius: const BorderRadius.only(
                                                      topLeft: Radius.circular(50),
                                                      topRight: Radius.circular(50)
                                                  )
                                              ),
                                              width: double.infinity,height: height/2.8,
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: Column(children: [
                                                  Container(
                                                    alignment: Alignment.topCenter,

                                                    decoration: const BoxDecoration(),
                                                    child: TextFormField(
                                                      validator:(value){
                                                        if(value==null||value.isEmpty) {
                                                          return 'this field shouldn\'t be empty';}
                                                        else {
                                                          return null;}
                                                      },
                                                      onChanged: (value) {},
                                                      keyboardType: TextInputType.text,
                                                      controller: emailcontroller,
                                                      onFieldSubmitted: (value) {
                                                        //valuefromtext=value;
                                                        //profilecubit.get(context).addConsultation(Consultation:value.toString() );
                                                      },
                                                      cursorColor: Colors.deepPurpleAccent,
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: Colors.grey[100],
                                                        prefixIcon: const Icon(Icons.edit,
                                                          color: Colors.deepPurpleAccent,),
                                                        labelText: 'Email',
                                                        labelStyle: const TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w400
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(
                                                                50)),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide(
                                                              color: Colors.deepPurple),
                                                          borderRadius: BorderRadius.circular(
                                                              50),),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide: const BorderSide(
                                                              color: Colors.white,),
                                                            borderRadius: BorderRadius.circular(
                                                                50)
                                                        ),
                                                      ),),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Container(
                                                    alignment: Alignment.topCenter,
                                                    decoration: const BoxDecoration(),
                                                    child: TextFormField(
                                                      validator:(value){
                                                        if(value==null||value.isEmpty) {
                                                          return 'this field shouldn\'t be empty';}
                                                        else {
                                                          return null;}
                                                      },
                                                      onChanged: (value) {},
                                                      keyboardType: TextInputType.text,
                                                      controller: passwordcontroller,
                                                      onFieldSubmitted: (value) {
                                                        //valuefromtext=value;
                                                        //profilecubit.get(context).addConsultation(Consultation:value.toString() );
                                                      },
                                                      cursorColor: Colors.deepPurpleAccent,
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: Colors.grey[100],
                                                        prefixIcon: const Icon(Icons.password,
                                                          color: Colors.deepPurpleAccent,),
                                                        labelText: 'Password',
                                                        labelStyle: const TextStyle(
                                                            color: Colors.black87,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w400
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(
                                                                50)),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide(
                                                              color: Colors.deepPurple),
                                                          borderRadius: BorderRadius.circular(
                                                              50),),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide: const BorderSide(
                                                              color: Colors.white,),
                                                            borderRadius: BorderRadius.circular(
                                                                50)
                                                        ),
                                                      ),),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        decoration:  BoxDecoration(
                                                            borderRadius: BorderRadius.circular(50),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  color: Color.fromARGB(210, 170, 148,251 ),
                                                                  blurRadius: 30.0,
                                                                  offset:Offset(0,1)
                                                              )]),
                                                        child: ElevatedButton(onPressed: (){
                                                           profilecubit.get(context).deleteprofile(
                                                               email: emailcontroller.text, password: passwordcontroller.text).then((value){
                                                             isOpen=false;
                                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));

                                                              });

                                                           },
                                                          child:Text('OK Delete',
                                                            style:TextStyle(fontSize: 16) ,),
                                                          style: ElevatedButton.styleFrom(
                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                            primary: Colors.deepPurpleAccent,
                                                            elevation: 15,
                                                          ),),
                                                      ),

                                                    ],
                                                  )




                                                ],),
                                              ))).closed.then((value){
                                        isOpen=false;  });
                                      isOpen=true;}
                                    else{

                                        Navigator.pop(context);
                                        isOpen=false;           }
                                  },
                                      child:Text('Delete Your Profile',
                                        style:TextStyle(fontSize: 16) ,),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                        primary: Colors.red[900],
                                        elevation: 15,
                                      )),
                                ),







                              ],),
                          ),
                        ],
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(top: 110,left: 130,right: 130),
                      child: Stack(  //user_image
                          alignment: Alignment.bottomRight,
                          children:[
                            Container(
                              height: height/5.8,
                              width: width/1.5,
                              clipBehavior: Clip.hardEdge,
                              decoration:BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(140),
                              ),
                              child: imageFile==null?CachedNetworkImage(imageUrl: 'http://10.0.2.2:8000/storage/${myprofile['image']}',
                                progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                                errorWidget: (context, url, error) => Icon(Icons.error,size: 60,),fit: BoxFit.cover, ):

                              Image.file(
                                imageFile,
                                fit: BoxFit.cover,
                              ),),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: IconButton(onPressed: (){
                                if(isOpen==false){
                                  scaffoldkey.currentState?.showBottomSheet(
                                      backgroundColor: Colors.deepPurple[100],
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
                                                var fromCamera = profilecubit.get(context).getFromCamera();
                                              },
                                                  icon: const Icon(Icons.camera,size: 30,)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: IconButton(
                                                  onPressed: (){
                                                    profilecubit.get(context).getFromGallery();
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
                          ]),
                    ),
                  ],),
                )

              ],
            ),),
          fallback: (context)=>CircularProgressIndicator() ,
        );
      }
        );
      }




