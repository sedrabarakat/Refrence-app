import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/modules/profiles/expert_profile_two.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/profiles/profiles_states.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:week_day_picker/week_day_picker.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/styles.dart';


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
    var start_time_Controller=TextEditingController();
    var end_time_Controller=TextEditingController();
    var description=TextEditingController();
    var namevalidate=GlobalKey<FormState>();
    var descriptionvalidate=GlobalKey<FormState>();
    var emailController=TextEditingController();
    var passwordcontroller=TextEditingController();
    return BlocProvider(
      create: (context)=>profilecubit()..getprofile()..get_booked_date() ,
      child:  BlocConsumer<profilecubit,profile_state>(
        listener: (context,profile_state){
          if(profile_state is Success_addFreetime_state) {
            Fluttertoast.showToast(
                msg: "Successfully Added",
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
          if(profile_state is Error_addFreetime_state) {
            Fluttertoast.showToast(
                msg: "${profilecubit.get(context).FreeTime_error}",
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red[700],
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        },
        builder: (context,profile_state){
          bool isOpen=false;
          bool skillisOpen=false;
          bool dateisOpen=false;
          File? imageFile=profilecubit.get(context).imageFile;
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;
          bool is_drop=profilecubit.get(context).is_drop;
          String ?start,end,day;
          List<dynamic>days=[];
          JustTheController scontroller=JustTheController();
          var weekDayPicker = WeekDayPicker(
            context: context,
            firstDate: DateTime(2021, 1, 13),
            lastDate: DateTime(2023, 10, 19),
          );
          int counter=profilecubit.get(context).counter;
          List <dynamic>?MyConsultation;
          var ConsultationController=TextEditingController();
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
                                height: (is_drop)?height+400:height/0.95,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[100],
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(40)
                                  ),),),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:60 ,horizontal:10 ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
                                      child: Center(
                                        child: Text('${profilecubit.get(context).firstname}   ${profilecubit.get(context).lastname}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold
                                          ),),
                                      ),),
                                    const SizedBox(height: 15,),
                                    def_textFromField(
                                        keyboardType: TextInputType.text,
                                        controller: first_namecontroller,
                                        labelText: 'first name',
                                        prefix: Icons.person,
                                        ValidatorFunc: (value){
                                          if(value==null||value.isEmpty) {
                                            return 'this field shouldn\'t be empty';}
                                          else {
                                            return null;}
                                        }),
                                    SizedBox(height: height/70,),
                                    def_textFromField(
                                        keyboardType: TextInputType.text,
                                        controller: last_namecontroller,
                                        labelText: 'last name',
                                        ValidatorFunc: (value){
                                          if(value==null||value.isEmpty) {
                                            return 'this field shouldn\'t be empty';}
                                          else {
                                            return null;}
                                        },
                                        prefix: Icons.person),
                                    SizedBox(height: height/70,),
                                    def_textFromField(
                                        keyboardType: TextInputType.phone,
                                        controller: phonecontroller,
                                        labelText: 'phone number',
                                        ValidatorFunc: (value){
                                          if(value==null||value.isEmpty) {
                                            return 'this field shouldn\'t be empty';}
                                          else {
                                            return null;}
                                        }, prefix: Icons.phone),
                                     SizedBox(height: height/70),
                                    Container(
                                      decoration: boxshadow,
                                      child: MaterialButton(onPressed: (){
                                        profilecubit.get(context).drop_down();
                                        profilecubit.get(context).getprofile();
                                      },child: Icon(Icons.arrow_drop_down,size: 40,color: Colors.deepPurple,)),
                                    ),
                                    ConditionalBuilder(
                                        condition: is_drop==true,
                                        builder: (context)=>Column(
                                          children: [
                                          def_textFromField(keyboardType: TextInputType.text,
                                              controller: countrycontroller,
                                              labelText: 'Country',
                                              ValidatorFunc: (value){
                                                if(value==null||value.isEmpty) {
                                                  return 'this field shouldn\'t be empty';}
                                                else {
                                                  return null;}
                                              }, prefix: Icons.location_on),
                                           SizedBox(height: height/70,),
                                          Row(
                                            children: [
                                              def_textFromField(
                                                C_width:width/2.0,
                                                keyboardType: TextInputType.text,
                                                  controller: citycontroller,
                                                  labelText: 'City', ValidatorFunc: (value){
                                                    if(value==null||value.isEmpty) {
                                                      return 'this field shouldn\'t be empty';}
                                                    else {
                                                      return null;}
                                                  },
                                                  prefix: Icons.location_city_sharp,),
                                              def_textFromField(
                                                  keyboardType: TextInputType.text,
                                                  controller: streetcontroller,
                                                  labelText: 'Street',
                                                  ValidatorFunc: (value){
                                                    if(value==null||value.isEmpty) {
                                                      return 'this field shouldn\'t be empty';}
                                                    else {
                                                      return null;}
                                                  },
                                                  prefix: Icons.home,
                                              C_width: width/2.4),
                                            ],),
                                          const SizedBox(height: 15,),
                                          def_textFromField(
                                              keyboardType: TextInputType.number,
                                              controller: walletcontroller,
                                              labelText: 'Wallet',
                                              ValidatorFunc: (value){},
                                              prefix: Icons.wallet),
                                          SizedBox(height: height/70,),
                                          def_textFromField(keyboardType: TextInputType.number,
                                              controller: chargingcontroller,
                                              labelText: 'Charging Hour', ValidatorFunc: (vlaue){},
                                              prefix: Icons.timer_rounded),
                                           SizedBox(height: height/70,),
                                        ],),
                                        fallback: (context)=>Container()),
                                    def_textFromField(
                                        keyboardType: TextInputType.none,
                                        controller: defalutcontroller(),
                                        labelText: 'My Skills',
                                        Tap: (){
                                          if(skillisOpen==false){
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
                                                    width: double.infinity,height: height/3.5,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(20.0),
                                                      child: Column(children: [
                                                        Container(
                                                          alignment: Alignment.topCenter,
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
                                                              minLines: 1,
                                                              maxLines: 2,//'name of experience'
                                                              cursorColor: Colors.deepPurpleAccent,
                                                              decoration: inside_deco.copyWith(
                                                                labelText: 'name of experience',
                                                                prefixIcon: const Icon(
                                                                  Icons.edit,
                                                                  color: Colors.deepPurpleAccent,
                                                              ),),),
                                                        )),
                                                        SizedBox(height: height/70,),
                                                        Container(
                                                          alignment: Alignment.topCenter,
                                                          decoration: const BoxDecoration(),
                                                          child: Form(
                                                            key: descriptionvalidate,
                                                            child: TextFormField(
                                                              maxLines: 4,
                                                              minLines: 1,
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
                                                              cursorColor: Colors.deepPurpleAccent,//description
                                                              decoration: inside_deco.copyWith(
                                                                prefixIcon: const Icon(Icons.description,
                                                                  color: Colors.deepPurpleAccent,),
                                                                labelText: 'description',
                                                              ),),
                                                          ),
                                                        ),
                                                        SizedBox(height: height/70,),
                                                        Row(mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              decoration: rough_shadow,
                                                              child: ElevatedButton(onPressed: (){
                                                                if(namevalidate.currentState!.validate() ) {
                                                                  if(descriptionvalidate.currentState!.validate()){
                                                                    profilecubit.get(context).add_experience(
                                                                        name_of_experience:name_of_experience.text.toString() ,
                                                                        description: description.text.toString()).then((value){
                                                                      Navigator.pop(context);
                                                                      skillisOpen=false;
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
                                                              decoration: rough_shadow,
                                                              child: ElevatedButton(onPressed: (){
                                                                if(namevalidate.currentState!.validate()){
                                                                  profilecubit.get(context).Removeexperience(
                                                                    name_of_experience:name_of_experience.text.toString() ,
                                                                  ).then((value){
                                                                    Navigator.pop(context);
                                                                    skillisOpen=false;
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
                                                          ],)
                                                      ],),
                                                    ))).closed.then((value){
                                              skillisOpen=false;  });
                                            skillisOpen=true;}
                                          else{
                                            if(namevalidate.currentState!.validate()){
                                              Navigator.pop(context);
                                              skillisOpen=false;  }                  }
                                        },
                                        ValidatorFunc: (value){}, prefix: Icons.description,
                                      max_line: 15,min_line: 1,
                                      C_width: width/1.1
                                    ),
                                    SizedBox(height: height/70,),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        def_textFromField(
                                          C_alignment:Alignment.topCenter ,
                                            C_width: width / 1.4,
                                            keyboardType:  TextInputType.text,
                                            controller: ConsultationController,
                                            labelText: 'Consultation',
                                            ValidatorFunc: (value){},
                                            prefix: Icons.wallet),
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
                                                color: Colors.deepPurple,)),),
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
                                    SizedBox(height: height/50,),
                                    def_textFromField(
                                      Tap: (){
                                        if(dateisOpen==false){
                                          scaffoldkey.currentState?.showBottomSheet(
                                              backgroundColor: Colors.deepPurple[100], (context) =>Container(
                                            alignment: Alignment.center,
                                            decoration:  BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [Colors.deepPurple.shade300,Colors.deepPurple.shade200,Colors.deepPurple.shade300]
                                                ),
                                                borderRadius: const BorderRadius.only(
                                                    topLeft: Radius.circular(50),
                                                    topRight: Radius.circular(50)
                                                )),
                                            width: double.infinity,height: height/2,
                                            child: Column(
                                              children: [
                                                SizedBox(height: height/25,),
                                                Padding(
                                                  padding:  EdgeInsets.only(left: height/2.6,top: height/310 ),
                                                  child: Tooltip(message: 'If you want To add Free Time...'
                                                      'please choose appropriate day then'
                                                      ' the beginning and the end Time , make sure that you choose only one day',
                                                    showDuration: Duration(seconds: 1),
                                                    waitDuration: Duration(milliseconds: 1) ,
                                                    padding: EdgeInsets.all(20),
                                                    child: CircleAvatar(radius: 12,
                                                      backgroundColor: Colors.grey[700],
                                                      child: Icon(Icons.question_mark),
                                                    ),),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                                  child: SelectWeekDays(
                                                    onSelect: (value){
                                                      days=value;
                                                    },
                                                    selectedDayTextColor: Colors.purple,
                                                    backgroundColor: Colors.purple,
                                                    fontSize:14,
                                                    fontWeight: FontWeight.w500,
                                                    boxDecoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    days: [DayInWeek('Sun'),DayInWeek('Mon'),DayInWeek('Tue'),DayInWeek('Wed'),DayInWeek('Thr'),DayInWeek('Fri'),DayInWeek('Sat')],
                                                  ),
                                                ),
                                                SizedBox(height: height/25,),
                                                Container(
                                                  width:width/1.3,height: height/14,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[100],
                                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                                  ),
                                                  child: Row(children: [
                                                    Container(
                                                      alignment: Alignment.center,
                                                      width: width/2.7,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.deepPurple,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              //(210, 170, 148,251 )
                                                                color: Color.fromARGB(210, 255, 255, 255),
                                                                blurRadius: 20.0,
                                                                offset:Offset(0,1)
                                                            ),
                                                          ],
                                                          borderRadius: BorderRadius.all(Radius.circular(30))),
                                                      child: const Text('Start Time',style: TextStyle(
                                                          color: Colors.white,fontSize: 18),),
                                                    ),
                                                    SizedBox(width: width/38),
                                                    Container(width: width/2.7,
                                                      child: TextFormField(
                                                        onChanged: (value){},
                                                        onTap: (){
                                                          showTimePicker(
                                                            context: context,
                                                            builder: (context, child) {
                                                              return MediaQuery(
                                                                data: MediaQuery.of(context).copyWith(
                                                                  // Using 24-Hour format
                                                                    alwaysUse24HourFormat: true), child: child!,);
                                                            },
                                                            initialTime: TimeOfDay.now(),
                                                          ).then((value){
                                                            start=value.toString()[10]+value.toString()[11]+value.toString()[12]+value.toString()[13]+value.toString()[14];
                                                            start_time_Controller.text=start!;
                                                            print(start);
                                                          });
                                                        },
                                                        keyboardType: TextInputType.none,
                                                        controller: start_time_Controller,
                                                        cursorColor: Colors.deepPurpleAccent ,
                                                        decoration: InputDecoration(
                                                          filled: true,
                                                          fillColor: Colors.grey[100],
                                                          hintText: 'Start',
                                                          labelStyle: const TextStyle(
                                                              color: Colors.black87,
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w400
                                                          ),
                                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: const BorderSide(color: Colors.white),
                                                            borderRadius: BorderRadius.circular(50),),
                                                          enabledBorder: OutlineInputBorder(borderSide:const BorderSide(
                                                            color: Colors.white,),
                                                              borderRadius: BorderRadius.circular(50)
                                                          ),
                                                        ),),
                                                    ),


                                                  ],),
                                                ),
                                                SizedBox(height: height/35,),
                                                Container(
                                                  width:width/1.3,height: height/14,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[100],
                                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: width/2.7,height: height/14,
                                                        decoration:  BoxDecoration(
                                                            color: Colors.deepPurple,
                                                            boxShadow: const [BoxShadow(
                                                              //(210, 170, 148,251 )
                                                                color: Color.fromARGB(210, 255, 255, 255),
                                                                blurRadius: 20.0,
                                                                offset:Offset(0,1)
                                                            ),],
                                                            borderRadius: BorderRadius.all(Radius.circular(30))),
                                                        child: const Text('End Time',style: TextStyle(
                                                            color: Colors.white,fontSize: 18),),
                                                      ),
                                                      SizedBox(width: width/38),
                                                      Container(width: width/2.7,
                                                        child: TextFormField(
                                                          onChanged: (value){},
                                                          onTap: (){
                                                            showTimePicker(
                                                              context: context,
                                                              builder: (context, child) {
                                                                return MediaQuery(
                                                                  data: MediaQuery.of(context).copyWith(
                                                                    // Using 24-Hour format
                                                                      alwaysUse24HourFormat: true), child: child!,);
                                                              },
                                                              initialTime: TimeOfDay.now(),
                                                            ).then((value){
                                                              end=value.toString()[10]+value.toString()[11]+value.toString()[12]+value.toString()[13]+value.toString()[14];
                                                              end_time_Controller.text=end.toString();
                                                              print(end);
                                                            });
                                                          },
                                                          keyboardType: TextInputType.none,
                                                          controller: end_time_Controller,
                                                          cursorColor: Colors.deepPurpleAccent ,
                                                          decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: Colors.grey[100],
                                                            hintText: 'End',
                                                            labelStyle: const TextStyle(
                                                                color: Colors.black87,
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w400
                                                            ),
                                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                                            focusedBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(color: Colors.white),
                                                              borderRadius: BorderRadius.circular(50),),
                                                            enabledBorder: OutlineInputBorder(borderSide:const BorderSide(
                                                              color: Colors.white,),
                                                                borderRadius: BorderRadius.circular(50)
                                                            ),
                                                          ),),
                                                      ),],),),
                                                SizedBox(height: height/60,),
                                                ElevatedButton(onPressed: (){
                                                  //DateTime? selectedDate = await weekDayPicker.show().then((value){print(DateFormat('EEEE').format(value!))});
                                                  if(days.length>1){
                                                    Fluttertoast.showToast(
                                                        msg: "Choose only one day",
                                                        gravity: ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor: Colors.red[700],
                                                        textColor: Colors.white,
                                                        fontSize: 16.0
                                                    );}
                                                  else{
                                                    day=(days[0]=='Sun')?'0':(days[0]=='Mon')?'1':(days[0]=='Tue')?'2':(days[0]=='Wed')?'3':(days[0]=='Thr')?'4':(days[0]=='Fri')?'5': '6';
                                                    profilecubit.get(context).Add_freeTimes(day: day.toString(), start: start.toString(), end: end.toString());
                                                  }
                                                },
                                                    child: Text('Add'),
                                                    style: ElevatedButton.styleFrom(
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                      primary: Colors.deepPurple[700],
                                                      elevation: 15,
                                                    )),
                                              ],),)
                                          );//showBottomSheet

                                        }
                                      },
                                        keyboardType: TextInputType.none,
                                        C_width: width/1.12,
                                        controller: defalutcontroller(),
                                        labelText: 'Add Free time',
                                        ValidatorFunc: (value){},
                                        max_line: 15,min_line: 1,
                                        prefix: Icons.timelapse),
                                    SizedBox(height: height/20),
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
                                  height: height/5.8, width: width/1.5,
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
                                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)
                                                )),
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
                                                        profilecubit.get(context).getFromGallery();},
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
