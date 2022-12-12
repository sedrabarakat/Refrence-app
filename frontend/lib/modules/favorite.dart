import 'package:flutter/material.dart';
import 'package:frontend/shared/network/local/shared_prefrence.dart';
import '../layouts/main_page/main_page/cubit_main_page.dart';
import 'login.dart';
class favorite extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 120,
          width: 120,
          color: Colors.deepPurple,
          child: MaterialButton(
            onPressed: (){
              cache_helper.removeData(key: 'token').then((value){
                Navigator.push(context, MaterialPageRoute(builder:(context)=> login()));
                print('token killed');
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
              cubit.get(context).getexpert();
            },
            child: Icon(Icons.icecream),
          ),
        ),
      ],
    );
  }
}

