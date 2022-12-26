import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/profiles/profiles_states.dart';

import '../../shared/components/components.dart';


Widget expert_profile(myprofile){

    var scaffoldkey= GlobalKey<ScaffoldState>();
    var phonecontroller=TextEditingController();
    var walletcontroller=TextEditingController();
    var countrycontroller=TextEditingController();
    var citycontroller=TextEditingController();
    var streetcontroller=TextEditingController();
    var chargingcontroller=TextEditingController();
    var first_namecontroller=TextEditingController();
    var last_namecontroller=TextEditingController();
    return BlocConsumer<profilecubit,profile_state>(
      listener: (context,profile_state){


      },
      builder: (context,profile_state){
        bool isOpen=false;
        File? imageFile=profilecubit.get(context).imageFile;
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        bool is_drop=profilecubit.get(context).is_drop;
        int counter=profilecubit.get(context).counter;
        if(myprofile.length>0){

          phonecontroller.text=(myprofile['phone_numbers'][0]['phone_number']).toString();
          walletcontroller.text=myprofile['wallet'].toString();
          countrycontroller.text=myprofile['expert']['country'].toString();
          citycontroller.text=myprofile['expert']['city'].toString();
          streetcontroller.text=myprofile['expert']['street'].toString();
        chargingcontroller.text=myprofile['expert']['hour_charging'].toString();
        first_namecontroller.text=myprofile['first_name'];
        last_namecontroller.text=myprofile['last_name'];
        }
        return ConditionalBuilder(
            condition:State is !Loading_getprofile_state,
            builder: (context)=>Scaffold(
              key: scaffoldkey,
              backgroundColor: Colors.grey[300],

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
                              height: (is_drop)?height*counter+250:height*counter,
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
                                    padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
                                    child: Expanded(
                                      child: Center(
                                        child: Text('${profilecubit.get(context).firstname}   ${profilecubit.get(context).lastname}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                      ),
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
                                  const SizedBox(height: 10,),
                                 Container(
                                   decoration:  BoxDecoration(
                                       boxShadow: [
                                         BoxShadow(
                                           //(210, 170, 148,251 )
                                             color: Color.fromARGB(210, 150, 140,251 ),
                                             blurRadius: 45.0,
                                             offset:Offset(0,15)
                                         ),]),
                                   child: MaterialButton(onPressed: (){
                                     profilecubit.get(context).drop_down();
                                     profilecubit.get(context).getprofile();
                                   },child: Icon(Icons.arrow_drop_down,size: 40,color: Colors.deepPurple,)),
                                 ),
                                  ConditionalBuilder(
                                      condition: is_drop==true,
                                      builder: (context)=>Column(children: [
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
                                              controller: countrycontroller,
                                              cursorColor: Colors.deepPurpleAccent ,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                prefixIcon: const Icon(Icons.location_on,color:Colors.deepPurpleAccent ,),
                                                labelText: 'Country',
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
                                        Row(
                                          children: [
                                            Container(
                                              width:width/2.0,
                                              decoration: const BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      //(210, 170, 148,251 )
                                                        color: Color.fromARGB(210, 150, 140,251 ),
                                                        blurRadius: 24.0,
                                                        offset:Offset(0,8)
                                                    ),]),
                                              child: Padding(
                                                padding:  const EdgeInsets.all(8),
                                                child: TextFormField(
                                                  onChanged: (value){},
                                                  keyboardType: TextInputType.text,
                                                  controller: citycontroller,
                                                  cursorColor: Colors.deepPurpleAccent ,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.grey[100],
                                                    prefixIcon: const Icon(Icons.location_city_sharp,color:Colors.deepPurpleAccent ,),
                                                    labelText: 'City',
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

                                            Container(
                                              width:width/2.4,
                                              decoration: const BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      //(210, 170, 148,251 )
                                                        color: Color.fromARGB(210, 150, 140,251 ),
                                                        blurRadius: 24.0,
                                                        offset:Offset(0,8)
                                                    ),]),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: TextFormField(
                                                  onChanged: (value){},
                                                  keyboardType: TextInputType.text,
                                                  controller: streetcontroller,
                                                  cursorColor: Colors.deepPurpleAccent ,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.grey[100],
                                                    prefixIcon: const Icon(Icons.home,color:Colors.deepPurpleAccent ,),
                                                    labelText: 'Street',
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
                                          ],),
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
                                              controller: chargingcontroller,
                                              cursorColor: Colors.deepPurpleAccent ,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                prefixIcon: const Icon(Icons.timer_rounded,color:Colors.deepPurpleAccent ,),
                                                labelText: 'Charging Hour',
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
                                        ),
                                        const SizedBox(height: 15,),
                                      ],),
                                      fallback: (context)=>Container()),
                                  ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (context,index)=>Row(children: [
                                        Container(
                                          width: width/1.5,
                                          decoration: const BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  //(210, 170, 148,251 )
                                                    color: Color.fromARGB(210, 150, 140,251 ),
                                                    blurRadius: 40.0,
                                                    offset:Offset(0,8)
                                                ),]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(

                                              onChanged: (value){},
                                              keyboardType: TextInputType.text,
                                              controller: defalutcontroller(),
                                              onFieldSubmitted: (value){},
                                              cursorColor: Colors.deepPurpleAccent ,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                prefixIcon: const Icon(Icons.wallet,color:Colors.deepPurpleAccent ,),
                                                labelText: 'Consultation',
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
                                        ),
                                        Container(
                                          width: 50,
                                          decoration:BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                          ) ,
                                          child: MaterialButton(onPressed: (){profilecubit.get(context).addtext();
                                          print(counter);
                                          },child: Icon(Icons.add_circle,color: Colors.deepPurple,)),
                                        ),
                                        Container(
                                          width: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50)),
                                          child: MaterialButton(
                                              onPressed: (){
                                                if(counter>1)
                                                  profilecubit.get(context).removetext();
                                                else if(counter==1){
                                                }
                                                print(counter);
                                              },child: Icon(Icons.remove_circle,color: Colors.red[800],)),
                                        )
                                      ],),
                                      separatorBuilder: (context,index)=>SizedBox(height: 10,),
                                      itemCount: counter),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(
                                        onPressed: (){
                                          profilecubit.get(context).updateprofile(
                                              image: imageFile,
                                              first_name: first_namecontroller.text,
                                              last_name:last_namecontroller.text ,
                                              phone_numbers: phonecontroller.text,
                                              city: citycontroller.text,
                                              street: streetcontroller.text,
                                              country: countrycontroller.text
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
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(onPressed: (){},
                                        child:Text('Delete Your Profile',
                                          style:TextStyle(fontSize: 16) ,),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                          primary: Colors.red[900],
                                          elevation: 15,
                                        )),
                                  )


                                ],),
                            ),
                          ],),
                      ),
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
                                //{myprofile?['image']}
                                child: imageFile==null?Image.network('http://10.0.2.2:8000/storage/${myprofile['image']}',fit: BoxFit.cover,):
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
            fallback: (context)=>CircularProgressIndicator());
      },
    );



}
