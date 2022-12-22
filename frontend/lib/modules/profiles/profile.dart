import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/profiles/profiles_states.dart';

import 'expert_profile.dart';
import 'normuser_profile.dart';

class profile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<profilecubit,profile_state>(
      listener: (context,profile_state){},
        builder: (context,profile_state){
          Map<String,dynamic>?myprofile=profilecubit.get(context).profile;
          return ConditionalBuilder(
           condition: (profilecubit.get(context).profile)!.length>0 ,
           builder: (context){
           if(myprofile?['is_expert']==0)
              return expert_profile();
           else {
              return User_profile();}
                      },
            fallback: (context)=>CircularProgressIndicator(color: Colors.deepPurple,backgroundColor: Colors.blue[900],),

    );

          }

    );}


  }