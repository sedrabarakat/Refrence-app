
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/layouts/main_page/states_mainpage.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit_main_page.dart';



class First extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
    return BlocConsumer<cubit,layout_state>(
      listener: (context,layoutstate){},
      builder: (context,layoutstate){
        return Scaffold(
            backgroundColor: Colors.blue.shade50,
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              actions: [
                IconButton(onPressed: (){}, icon:Icon(Icons.search))
              ],
            ),
            bottomNavigationBar: CurvedNavigationBar(

              key: _bottomNavigationKey,
              backgroundColor: Colors.blue.shade50,height: 50,

              index:cubit.get(context).index,
              onTap: (int value){
                cubit.get(context).on_Tap(value);
              },
              animationCurve:Curves.easeInBack,

              //easeInBack
              items: const [
                Icon(Icons.favorite,color: Colors.purple,size: 35),
                Icon(Icons.home,color: Colors.purple,size: 35,),
                Icon(Icons.person,color: Colors.purple,size: 35),

              ],
            ),
            body: cubit.get(context).list[cubit.get(context).index]
        );
      },
    );



  }
}
