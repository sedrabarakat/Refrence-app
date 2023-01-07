import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/profiles/profiles_states.dart';
import 'package:lottie/lottie.dart';

import '../../shared/components/components.dart';



Widget expert_profile_two(myprofile) {


 // expert_profile_two(this.myprofile);
    return BlocProvider(
        create: (context)=>profilecubit()..getprofile()..get_booked_date(),
        child: BlocConsumer<profilecubit,profile_state>(
          listener: (context,profile_state){},
          builder: (context,profile_state){
           // int counter=profilecubit.get(context).counter;
            File? imageFile=profilecubit.get(context).imageFile;
            double height = MediaQuery.of(context).size.height;
            double width = MediaQuery.of(context).size.width;
            List<dynamic>booked_date=profilecubit.get(context).booked_date;
            List<dynamic>MyConsultation=profilecubit.get(context).consultation;
            List<dynamic>experience=profilecubit.get(context).experience;
         //   var valuefromtext;
            return Scaffold(
              backgroundColor: Colors.deepPurple[50],
                body:SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipPath(
                        clipper: WaveClipperTwo(),
                        child: Container(
                          clipBehavior:Clip.antiAlias ,
                          height: height/3.6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image/key.webp')
                            ),
                            shape: BoxShape.rectangle,
                            gradient: LinearGradient(
                          colors: [Colors.deepPurple.shade100,Colors.deepPurple.shade200,Colors.deepPurple.shade300,Colors.deepPurple.shade400,Colors.deepPurple.shade600]
                          ),),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(height: height / 9, width: width / 4.6,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(70),
                                  ),
                                  child:  CachedNetworkImage(imageUrl: 'http://10.0.2.2:8000/storage/${myprofile?['image']}',
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        CircularProgressIndicator(value: downloadProgress.progress),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),),
                              ],),
                          ),),),
                      SizedBox(height: 30,),
                      const Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Text('My Booked Dates',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'AvenirLight'
                          )),
                      ),
                      SizedBox(
                        height: 290,
                        child: Padding(
                            padding: const EdgeInsets.only(),
                            child: ConditionalBuilder(
                              condition: booked_date.length>0,
                              builder:  (context)=>ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.all(20),
                                  shrinkWrap: true,
                                  itemBuilder: (context,index)=>Container(
                                    height: 100,width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        gradient: LinearGradient(
                                            colors: [Colors.blue.shade100,Colors.deepPurple.shade300])
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 100,width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(70),
                                              color: Colors.deepPurple,),
                                            child: CachedNetworkImage(imageUrl: 'http://10.0.2.2:8000/storage/${booked_date[index]['normal_user']['image']}',
                                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                  CircularProgressIndicator(value: downloadProgress.progress),
                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Text('${booked_date[index]['normal_user']['first_name']}   ${booked_date[index]['normal_user']['last_name']} ',
                                            style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'AvenirLight'
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Text('${booked_date[index]['date_order_by_user']}',
                                            style:const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'AvenirLight'
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text('Number of booked hour ${booked_date[index]['number_of_booked_hours']}',
                                            style: TextStyle(
                                                color: Colors.deepPurple[900],
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'AvenirLight'
                                            ),
                                          ),
                                        ],),
                                    ),),
                                  separatorBuilder: (context,index)=>SizedBox(width: 20),
                                  itemCount: booked_date.length),
                              fallback: (context)=>Center(child:Lottie.asset('assets/animation/clients.json')))
                            )),

                      SizedBox(height: 10,),
                      const Padding(
                        padding:  EdgeInsets.only(left: 35),
                        child: Text('My Consultation',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'AvenirLight'
                            )),),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: height/8,
                        child: ConditionalBuilder(
                        condition: MyConsultation.length>0,
                        builder:(context)=> ListView.separated(
                         physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                         itemBuilder: (context,index)=> Consultations_by_id(MyConsultation[index],width),
                        separatorBuilder:(context,index)=>SizedBox() ,
                        itemCount: MyConsultation.length),
                        fallback: (context)=>Center(child:Lottie.asset('assets/animation/loading.json')),
              ),
                      ),
                      const Padding(
                        padding:  EdgeInsets.only(left: 35),
                        child: Text('My Experience',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'AvenirLight'
                            )),),
                      SizedBox(height: 10,),
                      SizedBox(
                        height: height/4.3,
                        child: ConditionalBuilder(
                          condition: MyConsultation.length>0,
                          builder:(context)=> ListView.separated(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index)=> Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      gradient: LinearGradient(
                                          colors: [Colors.blue.shade100,Colors.blueGrey.shade300])
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
                                        child: Text('${experience[index]['name_of_experience']} ',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'AvenirLight'
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0),
                                        child: Text('description: ',

                                            style:const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'AvenirLight'
                                        )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0,top: 10),
                                        child: Text('${experience[index]['description']}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style:const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'AvenirLight'
                                          ),
                                        ),
                                      ),],
                                  ),
                                ),
                              ),
                              separatorBuilder:(context,index)=>SizedBox() ,
                              itemCount: experience.length),
                          fallback: (context)=>Center(child:Lottie.asset('assets/animation/loading.json')),
                        ),
                      ),
                      /*Container(
                        height: height/8,
                        width: width/5,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Consultations(MyConsultation),
                            separatorBuilder: (context, index) => SizedBox(height: 20,),
                            itemCount: MyConsultation.length),
                      )*/
                    ],),
                ),





            );

          }
      ),
    );

}
