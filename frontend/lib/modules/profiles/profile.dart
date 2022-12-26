import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/layouts/main_page/main_page/cubit_main_page.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/profiles/profiles_states.dart';
import 'package:lottie/lottie.dart';

import 'expert_profile.dart';
import 'normuser_profile.dart';

class profile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> profilecubit()..getprofile(),
      child: BlocConsumer<profilecubit,profile_state>(
        listener: (context,profile_state){},
          builder: (context,profile_state){
            Map<String,dynamic>?myprofile=profilecubit.get(context).profile;
            int p=profilecubit.get(context).begin;

            return ConditionalBuilder(
             condition:myprofile.length>0,
             builder: (context) {
               if (p == 1)
                 return expert_profile(myprofile);
               else {
                 return User_profile(myprofile);
               }
             }  ,
              fallback: (context)=>Center(child: Lottie.asset('assets/animation/animation.json')),

      );

            }

      ),
    );}


  }