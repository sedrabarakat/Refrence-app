
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/layouts/main_page/main_page/states_mainpage.dart';
import 'package:frontend/shared/network/local/shared_prefrence.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/login.dart';
import 'cubit_main_page.dart';




class First extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
    return BlocConsumer<cubit,layout_state>(
      listener: (context,layoutstate){},
      builder: (context,layoutstate){
        var index=cubit.get(context).index;
        return Scaffold(
            backgroundColor: Colors.blue.shade50,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: (index==0)?Color.fromARGB(255, 49, 35, 131):
              (index==1)? Color.fromARGB(255, 102, 39, 203):
              (index==2)?Colors.deepPurple:
              (index==3)? Color.fromARGB(255, 20, 36, 87):Colors.deepPurple,
              actions: [
                MaterialButton(onPressed: (){
                  cache_helper.removeData(key: 'token').then((value){
                    print('token killed');
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> login()));
                  });
                },child: Row(children: [
                  Icon( Icons.door_front_door_rounded,color: Colors.grey[300],),
                  SizedBox(width: 10,),
                  Text('LOGOUT',style: TextStyle(color: Colors.grey[300]),),
                ],),)
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
                Icon(Icons.search,color: Colors.purple,size: 35),
              ],
            ),
            body: cubit.get(context).list[cubit.get(context).index]
        );
      },
    );



  }
}
