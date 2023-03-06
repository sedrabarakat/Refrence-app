import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:frontend/layouts/main_page/main_page/states_mainpage.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/profiles/profiles_states.dart';
import 'package:frontend/shared/network/local/shared_prefrence.dart';
import 'package:lottie/lottie.dart';
import '../layouts/main_page/main_page/cubit_main_page.dart';
import '../shared/components/components.dart';
import 'login.dart';
class favorite extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit()..myfav(),
      child: BlocConsumer<cubit,layout_state>(
          listener: (context,layout_state){},
          builder:(context,layout_state){
            List<dynamic> ?fav=cubit.get(context).fav;
            double height = MediaQuery.of(context).size.height;
            double width = MediaQuery.of(context).size.width;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child:Container(
                        height:height/4.9 ,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/rating.png'),fit: BoxFit.cover
                          )
                        ),
                      ),),
                  ),
                  ConditionalBuilder(
                    condition: fav.length>0,
                    builder:(context)=> SizedBox(
                      height: height+fav.length,
                      child: ListView.separated(
                        shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context,index)=> favcell(fav[index],context,fav[index]['expert_id']),
                          separatorBuilder:(context,index)=>SizedBox() ,
                          itemCount: fav.length),
                    ),
                    fallback: (context)=>Center(child:Lottie.asset('assets/animation/rate.json')),
                  ),
                ],
              ),
            );
          }

      ),
    );
  }
}

