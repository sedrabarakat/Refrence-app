import 'package:flutter/cupertino.dart';
import 'package:frontend/modules/outer_profile/pro_cubit.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/layouts/main_page/main_page/cubit_main_page.dart';
import 'package:frontend/layouts/main_page/main_page/states_mainpage.dart';
import 'package:intl/intl.dart';

import '../../modules/outer_profile/profile.dart';
import '../../modules/search_id.dart';
import '../../widgets/proff.dart';

Widget cell(expertlist,context,id){

  return GestureDetector(
    onTap: (){
      Get.to(pro_profile(id),arguments:id);

      },
   //   {Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(expertlist['expert_id'])));},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
              colors: [Colors.cyan.shade200,Colors.deepPurple.shade300]
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                  ),
                child: CachedNetworkImage(imageUrl: 'http://10.0.2.2:8000/storage/${expertlist['image']}',
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 5,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${expertlist['first_name']} ${expertlist['last_name']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )),
                      const SizedBox(height: 10,),
                      Text((expertlist['consultations']!=null)?'${(expertlist['consultations'][0]['type_of_consulatation']['name_of_consultations']).toString()}':'Tap here to see details',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15
                          )),
                      SizedBox(height: 10,),
                      Row(children: [
                        Icon(Icons.star_rate,size: 18,color: Colors.deepPurple,),
                        SizedBox(width: 5,),
                        Text((expertlist['rating']==null)?'rated as 0 stars ':
                            'rated as ${expertlist['rating']} stars ',
                            style: TextStyle(
                                color: Colors.deepPurple.shade900,
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ))
                      ],)
                    ],),
                ),
              )
            ],),
        ),
      ),
    ),
  );
}//Colors.cyan.shade300,Colors.purple.shade200,Colors.deepPurple.shade300


Widget Consultations_by_id(list,width){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      width: width/2,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          gradient: LinearGradient(colors: [Colors.deepPurple.shade100,Colors.deepPurple.shade300,Colors.deepPurple.shade400] )
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Text('${list['type_of_consulatation']['name_of_consultations']}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500

              ),
            )),
      ),

    ),
  );
}

TextEditingController defalutcontroller(){
  var controller=TextEditingController();

  return controller;
}


Widget Searchcell(context,searchexpertlist,index){

  return GestureDetector(
    onTap: (){
      if(searchexpertlist['is_expert']==1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => pro_profile(searchexpertlist['user_id'])));
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
              colors: [Colors.cyan.shade200,Colors.deepPurple.shade300,]
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CachedNetworkImage(imageUrl: 'http://10.0.2.2:8000/storage/${searchexpertlist['image']}',fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 5,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('${searchexpertlist['first_name']} ${searchexpertlist['last_name']}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        )),
                  ),
                ),
              )
            ],),
        ),
      ),
    ),
  );
}
//cubit.get(context).getexpert_byConsultation_id(id:SearchConsultation[index]['id_of_consultations']);

Widget Consultationcell_inprofile(id,index){
  return BlocConsumer<cubit,layout_state>(

    listener:(context,layoutState){
      if(State is Success_Consultationsearch_state)
        cubit.get(context).getexpert_byConsultation_id(id: id);
      },
    builder: (context,layoutState){

      List<dynamic>?consultationId=cubit.get(context).expert_list_id;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
                colors: [Colors.cyan.shade200,Colors.deepPurple.shade300,]
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 9,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: CachedNetworkImage(imageUrl: 'http://10.0.2.2:8000/storage/${consultationId[index]['expert']['normal_user']['image']}',fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('${consultationId[index]['expert']['normal_user']['first_name']} ${consultationId[index]['expert']['normal_user']['last_name']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )),
                    ),
                  ),
                )
              ],),
          ),
        ),
      );
    },
  );
}

Widget Consultation(SearchConsultation,context){
  return GestureDetector(
    onTap: (){
      cubit.get(context).getexpert_byConsultation_id(id: SearchConsultation['id_of_consultations']).then(
              (value) =>   Navigator.push(context, MaterialPageRoute(builder: (context)=>search_id(SearchConsultation['id_of_consultations']))));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(colors: [Colors.cyan.shade200,Colors.deepPurple.shade300,]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(0, 5), // changes position of shadow
            ),],),
        child: Center(
          child: Text('${SearchConsultation['name_of_consultations']}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              )),
        ),),
    ),
  );
}

Widget by_idcell(searchexpertlist,context){

  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>pro_profile(searchexpertlist['expert_id'])));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
              colors: [Colors.cyan.shade200,Colors.deepPurple.shade300,]
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CachedNetworkImage(imageUrl: 'http://10.0.2.2:8000/storage/${searchexpertlist['expert']['normal_user']['image']}',fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 5,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('${searchexpertlist['expert']['normal_user']['first_name']} ${searchexpertlist['expert']['normal_user']['last_name']}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        )),
                  ),
                ),
              )
            ],),
        ),
      ),
    ),
  );
}

Widget experience(){
  return Container(
    height: 100,width: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
            colors: [Colors.blue.shade100,Colors.deepPurple.shade300])
    ),
    child: Column(
      children: [
        Text(' ',
        style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'AvenirLight'
        ),
      ),
        SizedBox(height: 20,),
        Text('',
          style:const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'AvenirLight'
          ),
        ),],
    ),
  );
}

Widget Consultation_view(all_consultation,index,context){
  return GestureDetector(

    onTap: (){
      cubit.get(context).getexpert_byConsultation_id(id: all_consultation[index]['id_of_consultations']).then(
              (value) =>   Navigator.push(context, MaterialPageRoute(builder: (context)=>search_id(all_consultation[index]['id_of_consultations']))));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent.shade100,Colors.deepPurple.shade300,Colors.deepPurple.shade400]),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('${all_consultation[index]['name_of_consultations']}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20
              )
          ),
        )),
      ),
    ),
  );
}

Widget favcell(expertlist,context,id){

  return GestureDetector(
    onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>pro_profile(id)));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
              colors: [Colors.deepPurple.shade100,Colors.deepPurple.shade200,Colors.deepPurple.shade300,Colors.deepPurple.shade400,Colors.deepPurple.shade500]), boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                ),
                child: CachedNetworkImage(imageUrl: 'http://10.0.2.2:8000/storage/${expertlist['expert']['normal_user']['image']}',
                    fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) =>const Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 5,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${expertlist['expert']['normal_user']['first_name']} ${expertlist['expert']['normal_user']['last_name']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )),

                      SizedBox(height: 10,),
                      Row(children: [
                        Icon(Icons.star_rate,size: 18,color: Colors.deepPurple,),
                        SizedBox(width: 5,),
                        Text('rated as 4 stars ',
                            style: TextStyle(
                                color: Colors.deepPurple.shade900,
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ))
                      ],)
                    ],),
                ),
              )
            ],),
        ),
      ),
    ),
  );
}
Widget pro_experince(list,index){
  return Padding(
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
        children:  [
          Padding(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
            child: Text('${list?[index]['name_of_experience']}',//${experience[index]['name_of_experience']}
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'AvenirLight'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text('description:',
                style:const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'AvenirLight'
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0,top: 10,right: 12),
            child:  Text('${list[index]['description']}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style:TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'AvenirLight'
              ),
            ),
          ),],
      ),
    ),
  );
}
ElevatedButton date_button(context,id,height,width){
  return ElevatedButton(
    onPressed: (){
      showDatePicker(context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.purple, // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.purple,
                  // <-- SEE HERE
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: Colors.purple, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
          initialDate: DateTime.now(),
          firstDate: DateTime(2023),
          lastDate: DateTime(2024)).then((value){
        // print(DateFormat('yyyy').format(value!));
        //print(DateFormat('MM').format(value!));
        //print(DateFormat('dd').format(value!));
        if(value!=null){
          pro_cubit.get(context).get_freetimes_bydate(
              id: id,
              date: '${(DateFormat('yyyy').format(value!))}:${(DateFormat('MM').format(value!))}:${(DateFormat('dd').format(value!))}'
          );}
      });
    }, child: Text('pick a date'),
    style: ElevatedButton.styleFrom(
      shadowColor:Colors.purpleAccent,
      minimumSize: Size(width/1.8, height/20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      primary: Colors.deepPurple,
      disabledBackgroundColor: Colors.deepPurple,
      disabledForegroundColor: Colors.purpleAccent,
    ),);
}


Widget all_free_time(height,index,All_freetime){
  var scrollable=ScrollController();
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
              colors: [Colors.blue.shade100,Colors.blueGrey.shade300])
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
           Padding(
            padding: EdgeInsets.only(top: 20,bottom: 5),
            child: Text((All_freetime[index]['day_of_free']==0)?'Sunday':(All_freetime[index]['day_of_free']==1)?'Monday':
            (All_freetime[index]['day_of_free']==2)?'Tuesday':(All_freetime[index]['day_of_free']==3)?'Wednesday':(All_freetime[index]['day_of_free']==4)?'Thursday'
                :(All_freetime[index]['day_of_free']==5)?'Friday':'Saturday',//${experience[index]['name_of_experience']}
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'AvenirLight'
              ),),
          ),
          SizedBox(height:height/4.2,
            child: CupertinoScrollbar(
              controller: scrollable,
              radius: Radius.circular(20),
              thickness: 10,
              thumbVisibility:true,
              child: ListView.separated(
                controller: scrollable,
                  shrinkWrap: true,
                  itemBuilder: (context,num)=>Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      height: height/10,
                      decoration: BoxDecoration
                        (
                          borderRadius: BorderRadius.circular(35),
                          gradient: LinearGradient(
                              colors: [Colors.deepPurple.shade100,
                                Colors.deepPurple.shade200,Colors.deepPurple.shade300] )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('start at  ${All_freetime[index]['discrete_time'][num]['start_time']}',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text('End at    ${All_freetime[index]['discrete_time'][num]['end_time']}',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          ],),
                    ),
                  ),
                  separatorBuilder: (context,index)=> Container(),
                  itemCount: All_freetime[index]['discrete_time'].length),
            ),
          ),

        ],),
    ),
  );
}