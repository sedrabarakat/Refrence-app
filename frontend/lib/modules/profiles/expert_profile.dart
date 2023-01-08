import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/layouts/main_page/main_page/cubit_main_page.dart';
import 'package:frontend/modules/profiles/expert_profile_two.dart';
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
    var name_of_experience=TextEditingController();
    var description=TextEditingController();
    var namevalidate=GlobalKey<FormState>();
    var descriptionvalidate=GlobalKey<FormState>();
    var emailController=TextEditingController();
        var passwordcontroller=TextEditingController();
    return BlocProvider(
      create: (context)=>profilecubit()..getprofile()..get_booked_date() ,
      child:  BlocConsumer<profilecubit,profile_state>(
        listener: (context,profile_state){},
        builder: (context,profile_state){
          bool isOpen=false;
          File? imageFile=profilecubit.get(context).imageFile;
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;
          bool is_drop=profilecubit.get(context).is_drop;
          int counter=profilecubit.get(context).counter;
          List <dynamic>?MyConsultation;
          var ConsultationController=TextEditingController();
          String ?sa;
          if(myprofile.length>0){
            phonecontroller.text=(myprofile['phone_numbers'][0]['phone_number']).toString();
            walletcontroller.text=myprofile['wallet'].toString();
            countrycontroller.text=myprofile['expert']['country'].toString();
            citycontroller.text=myprofile['expert']['city'].toString();
            streetcontroller.text=myprofile['expert']['street'].toString();
            chargingcontroller.text=myprofile['expert']['hour_charging'].toString();
            first_namecontroller.text=myprofile['first_name'];
            last_namecontroller.text=myprofile['last_name'];
            //MyConsultation=myprofile['expert']['consultations'];

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
                                height: (is_drop)?height+400:height/1,
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

                                    Container(
                                      width: width,

                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              //(210, 170, 148,251 )
                                                color: Color.fromARGB(210, 150, 140,251 ),
                                                blurRadius: 40.0,
                                                offset:Offset(0,8)
                                            ),]),
                                      child: TextFormField(
                                        onTap: (){
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
                                                        child: Form(
                                                          key: namevalidate,
                                                          child: TextFormField(
                                                              validator:(value){
                                                                if(value==null||value.isEmpty) {
                                                                  return 'this field shouldn\'t be empty';}
                                                                else {
                                                                  return null;}
                                                              },
                                                            onChanged: (value) {},
                                                            keyboardType: TextInputType.text,
                                                            controller: name_of_experience,
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
                                                              labelText: 'name of experience',
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
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Container(
                                                        alignment: Alignment.topCenter,
                                                        decoration: const BoxDecoration(),
                                                        child: Form(
                                                          key: descriptionvalidate,
                                                          child: TextFormField(
                                                            validator:(value){
                                                              if(value==null||value.isEmpty) {
                                                                return 'this field shouldn\'t be empty';}
                                                              else {
                                                                return null;}
                                                            },
                                                            onChanged: (value) {},
                                                            keyboardType: TextInputType.text,
                                                            controller: description,
                                                            onFieldSubmitted: (value) {
                                                              //valuefromtext=value;
                                                              //profilecubit.get(context).addConsultation(Consultation:value.toString() );
                                                            },
                                                            cursorColor: Colors.deepPurpleAccent,
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              prefixIcon: const Icon(Icons.description,
                                                                color: Colors.deepPurpleAccent,),
                                                              labelText: 'description',
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
                                                             if(namevalidate.currentState!.validate() ) {
                                                               if(descriptionvalidate.currentState!.validate()){
                                                                 profilecubit.get(context).add_experience(
                                                                     name_of_experience:name_of_experience.text.toString() ,
                                                                     description: description.text.toString()).then((value){
                                                                   Navigator.pop(context);
                                                                   isOpen=false;
                                                                 });
                                                               }
                                                             } },
                                                             child:Text('OK',
                                                               style:TextStyle(fontSize: 16) ,),
                                                             style: ElevatedButton.styleFrom(
                                                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                               primary: Colors.deepPurpleAccent,
                                                               elevation: 15,
                                                             ),),
                                                         ),
                                                         SizedBox(width: 20,),
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
                                                             if(namevalidate.currentState!.validate()){
                                                               profilecubit.get(context).Removeexperience(
                                                                 name_of_experience:name_of_experience.text.toString() ,
                                                                   ).then((value){
                                                                 Navigator.pop(context);
                                                                 isOpen=false;
                                                               });
                                                             }},
                                                             child:Text('Delete',
                                                               style:TextStyle(fontSize: 16) ,),
                                                             style: ElevatedButton.styleFrom(
                                                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                               primary: Colors.red[900],
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
                                            if(namevalidate.currentState!.validate()){
                                            Navigator.pop(context);
                                            isOpen=false;  }                  }
                                        },
                                          onChanged: (value){},
                                          onFieldSubmitted: (value){},
                                          keyboardType: TextInputType.none,
                                          controller: defalutcontroller(),
                                          cursorColor: Colors.deepPurpleAccent ,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                            prefixIcon: const Icon(Icons.description,color:Colors.deepPurpleAccent ,),
                                            labelText: 'My Skills',
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
                                          maxLines: 15,
                                          minLines: 1),

                                    ),
                                    SizedBox(height: 25,),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          alignment: Alignment.topCenter,
                                          width: width / 1.5,
                                          decoration: const BoxDecoration(),
                                          child: TextFormField(
                                            onChanged: (value) {},
                                            keyboardType: TextInputType.text,
                                            controller: ConsultationController,
                                            onFieldSubmitted: (value) {
                                              //valuefromtext=value;
                                              //profilecubit.get(context).addConsultation(Consultation:value.toString() );
                                            },
                                            cursorColor: Colors.deepPurpleAccent,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[100],
                                              prefixIcon: const Icon(Icons.wallet,
                                                color: Colors.deepPurpleAccent,),
                                              labelText: 'Consultation',
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
                                        Container(
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                          child: MaterialButton(onPressed: () {
                                            profilecubit.get(context).addConsultation(Consultation: ConsultationController.text);
                                            //  profilecubit.get(context).addtext();
                                            //  print(counter);
                                          },
                                              child: Icon(Icons.add_circle,
                                                color: Colors.deepPurple,)),
                                        ),
                                        Container(
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50)),
                                          child: MaterialButton(
                                              onPressed: () {
                                                /* if (counter > 1) profilecubit.get(context).removetext();   else if (counter == 1) {}  print(counter);*/
                                                profilecubit.get(context).RemoveConsultation(name:ConsultationController.text);
                                              },
                                              child: Icon(Icons.remove_circle,
                                                color: Colors.red[800],)),
                                        )
                                      ],),

                                    SizedBox(height: 25,),
                                    Container(
                                      width: width/1.5,
                                      child: ElevatedButton(
                                          onPressed: (){
                                            profilecubit.get(context).get_booked_date();
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>expert_profile_two(myprofile))
                                            );
                                          },

                                          child:Text('See my dates and consultations',
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
                                      child: ElevatedButton(onPressed: (){

                                      },
                                          child:Text('Delete My Profile',
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
              fallback: (context)=>CircularProgressIndicator());
        },
      ),
    );



}
