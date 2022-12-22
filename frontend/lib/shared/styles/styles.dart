
import 'package:flutter/material.dart';

class Roundedbutton extends StatelessWidget {
  const Roundedbutton({required this.text, required this.ontap});

  final String text;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( child: Text(
        '$text',
        style: TextStyle(color: Colors.white,fontSize: 16)),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        primary: Colors.deepPurpleAccent,
        elevation: 15,
      ),onPressed: ontap,
    );
  }}


var d= InputDecoration(
filled: true,
fillColor: Colors.grey[100],
prefixIcon: const Icon(Icons.lock,color:Colors.deepPurpleAccent,),
labelText: 'Password',
labelStyle: const TextStyle(
color: Colors.black87,
fontSize: 18,
fontWeight: FontWeight.w400,
fontFamily: 'AvenirLight'
),
border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
focusedBorder: OutlineInputBorder(
borderSide: const BorderSide(color: Colors.deepPurple),
borderRadius: BorderRadius.circular(50),),
enabledBorder: OutlineInputBorder(borderSide:const BorderSide(
color: Colors.white,),
borderRadius: BorderRadius.circular(50)
));

const msh =  BoxDecoration(
boxShadow: [
BoxShadow(
color: Color.fromARGB(210, 170, 148,251 ),
blurRadius: 20.0,
offset:Offset(0,15)
),]);
