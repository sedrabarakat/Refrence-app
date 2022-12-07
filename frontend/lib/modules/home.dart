import 'package:flutter/material.dart';

import '../shared/components/components.dart';


class home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index)=> cell(),
        separatorBuilder:(context,index)=>SizedBox() ,
        itemCount: 10);
  }
}