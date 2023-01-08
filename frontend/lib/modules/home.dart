

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';


import '../layouts/main_page/main_page/cubit_main_page.dart';
import '../layouts/main_page/main_page/states_mainpage.dart';
import '../shared/components/components.dart';
import 'expert_view.dart';

class home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit()..getexpert()..allconsultation(),
      child: BlocConsumer<cubit,layout_state>(
          listener: (context,layout_state){},
          builder:(context,layout_state){
            List<dynamic> ?expertlist=cubit.get(context).expertlist;
            List<dynamic> ?all_consultation=cubit.get(context).all_consultation;
            double height = MediaQuery.of(context).size.height;
            double width = MediaQuery.of(context).size.width;
            return SingleChildScrollView(
              child: Column(
                children: [
                  ClipPath(
                      clipper: WaveClipperTwo(flip: true,),
                      child: Container(height: height/4,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/image/la.png'),fit: BoxFit.cover)
                      ),)),
                ConditionalBuilder(
                    condition: all_consultation.length>0,
                    builder:  (context)=>Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index)=>Consultation_view(all_consultation,index,context),
                          separatorBuilder: (context,index)=>SizedBox(width: 2,),
                          itemCount: all_consultation.length),
                      ),
                    ),
                    fallback: (context)=>Container()),
              ConditionalBuilder(
              condition: expertlist!.length>0,
                builder:(context)=> InkWell(
                  focusColor: Colors.blue,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index)=> cell(expertlist![index]['normal_user']),
                      separatorBuilder:(context,index)=>SizedBox() ,
                      itemCount: expertlist.length),
                ),
                fallback: (context)=>Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Center(
                      child:Lottie.asset('assets/animation/business.json')),
                ),
              )
              ],),
            );
          }

      ),
    );
  }
}
