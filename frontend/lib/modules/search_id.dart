import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:frontend/shared/components/components.dart';
import 'package:lottie/lottie.dart';
import '../layouts/main_page/main_page/cubit_main_page.dart';
import '../layouts/main_page/main_page/states_mainpage.dart';

Widget search_id(id)  {

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: BlocProvider(
        create: (context)=>cubit()..getexpert_byConsultation_id(id: id),
        child: BlocConsumer<cubit,layout_state>(
          listener:(context,layout_state){

          } ,
        builder: (context,layout_state){
          List <dynamic>last=cubit.get(context).expert_list_id;
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;
          return  SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    clipBehavior:Clip.antiAlias ,
                    height: height/3.7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/search.png'),fit: BoxFit.cover
                      ),
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade100,Colors.blue.shade100,Colors.blue.shade300,Colors.blue.shade400]
                      ),),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),),),

                ConditionalBuilder(
                    condition:State is !Loading_id_state ,
                    builder: (context)=>ListView.separated(
                        shrinkWrap: true,
                     itemBuilder: (context,index)=>by_idcell(last[index]),
                    separatorBuilder: (context,index)=>SizedBox(height: 5,),
                    itemCount: last.length),
                    fallback: (context)=>Center(child:Lottie.asset('assets/animation/search-users.json'))
                )
              ],),
          );

        },),
      ),
    );

}
