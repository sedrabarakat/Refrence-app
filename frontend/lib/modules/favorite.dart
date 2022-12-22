import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/layouts/main_page/main_page/states_mainpage.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/shared/network/local/shared_prefrence.dart';
import '../layouts/main_page/main_page/cubit_main_page.dart';
import 'login.dart';
class favorite extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubit,layout_state>(
      listener: (context,layout_state){},
      builder: (context,layout_state){
        return Row(
          children: [
            Container(
              height: 120,
              width: 120,
              color: Colors.deepPurple,
              child: MaterialButton(
                onPressed: (){
                  cache_helper.removeData(key: 'token').then((value){
                    print('token killed');
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> login()));

                  });

                },
                child: Icon(Icons.icecream),
              ),
            ),
            Container(
              height: 120,
              width: 120,
              color: Colors.blue,
              child: MaterialButton(
                onPressed: (){
                  {

                  }
                },
                child: Icon(Icons.icecream),
              ),
            ),
          ],
        );
      },
    );
  }
}

