

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layouts/main_page/main_page/cubit_main_page.dart';
import '../layouts/main_page/main_page/states_mainpage.dart';
import '../shared/components/components.dart';

class home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubit,layout_state>(
        listener: (context,layout_state){},
        builder:(context,layout_state){
          List<dynamic> ?expertlist=cubit.get(context).expertlist;
          return ConditionalBuilder(
            condition: expertlist!.length>0,
            builder:(context)=> InkWell(
              focusColor:Colors.pink,
              onTap: (){},
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index)=> cell(expertlist![index]['normal_user']),
                  separatorBuilder:(context,index)=>SizedBox() ,
                  itemCount: expertlist.length),
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          );
        }

    );
  }
}
