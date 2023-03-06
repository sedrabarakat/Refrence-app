
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


var decoration= InputDecoration(
filled: true,
fillColor: Colors.grey[100],
prefixIcon: const Icon(Icons.lock,color:Colors.deepPurpleAccent,),
labelText: 'Password',
labelStyle: const TextStyle(
color: Colors.black87,
fontSize: 18,
fontWeight: FontWeight.w400,
fontFamily: 'AvenirLight',
),
border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
focusedBorder: OutlineInputBorder(
borderSide: const BorderSide(color: Colors.deepPurple),
borderRadius: BorderRadius.circular(50),),
enabledBorder: OutlineInputBorder(borderSide:const BorderSide(
color: Colors.white,),
borderRadius: BorderRadius.circular(50)
));

var inside_deco=InputDecoration(
  filled: true,
  fillColor: Colors.grey[100],
  labelStyle: const TextStyle(
      color: Colors.black87,
      fontSize: 18,
      fontWeight: FontWeight.w400
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
          50)),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
        color: Colors.deepPurple),
    borderRadius: BorderRadius.circular(
        50),),
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,),
      borderRadius: BorderRadius.circular(
          50)
  ),
);
var rough_shadow=BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    boxShadow:  const [
      BoxShadow(
          color: Color.fromARGB(210, 170, 148,251 ),
          blurRadius: 30.0,
          offset:Offset(0,1)
      )]);
const boxshadow =  BoxDecoration(
boxShadow: [
BoxShadow(
color: Color.fromARGB(210, 170, 148,251 ),
blurRadius: 20.0,
offset:Offset(0,15)
),]);

Widget def_textFromField({
  required TextInputType keyboardType,
  required TextEditingController controller,
  required String labelText,
  required FormFieldValidator ValidatorFunc,
  required IconData prefix,
  var C_width,
  var max_line,
  var min_line,
  AlignmentGeometry ?C_alignment,
  bool is_Read=true,
  ValueChanged<String>? Changed,
  ValueChanged<String>? Submited,
  GestureTapCallback?Tap,
}){
  return Container(
    alignment: C_alignment,
    width: C_width,
    decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            //(210, 170, 148,251 )
              color: Color.fromARGB(210, 150, 140,251 ),
              blurRadius: 24.0,
              offset:Offset(0,8)
          ),]),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          onChanged:Changed ,
          onFieldSubmitted: Submited,
          onTap: Tap,
          readOnly:is_Read ,
          keyboardType:keyboardType,
          controller: controller,
          cursorColor: Colors.deepPurpleAccent,
        maxLines: max_line,minLines: min_line,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon:  Icon(prefix,color:Colors.deepPurpleAccent ,),
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w400
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(50),),
          enabledBorder: OutlineInputBorder(borderSide:const BorderSide(
            color: Colors.white,),
              borderRadius: BorderRadius.circular(50)
          ),

        ),
        validator: ValidatorFunc,
      ),
    ),
  );
}
