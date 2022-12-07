import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


import 'package:email_validator/email_validator.dart';

import '../layouts/main_page/cubit_main_page.dart';
import '../layouts/main_page/main_page.dart';
import '../layouts/main_page/states_mainpage.dart';

class login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var emailcontroller=TextEditingController();
    var passwordcontroller=TextEditingController();
    var formkey =GlobalKey<FormState>();
    return BlocConsumer<cubit,layout_state>(
      listener: (context,layout_state){},
      builder: (context,layout_state){
        bool is_secure=cubit.get(context).issecure;
        return Scaffold(
            backgroundColor:Colors.deepPurple[25],
            body: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: 360,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        image:const DecorationImage(
                            image: AssetImage('assets/image/yourwelcome.png'),
                            fit: BoxFit.cover
                        )),),
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(210, 170, 148,251 ),
                                blurRadius: 20.0,
                                offset:Offset(0,15)
                            ),]),
                      child: TextFormField(
                        onChanged: (value){},
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcontroller,
                        cursorColor: Colors.deepPurpleAccent ,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          prefixIcon: Icon(Icons.email,color:Colors.deepPurpleAccent ,),
                          labelText: 'Email',
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
                        validator: (value){
                          if(!value!.contains('@')&& !value.contains('.')&& !value.contains('com'))
                            return 'please enter an email address';
                          else if(value==null||value.isEmpty) {
                            return 'this field shouldn\'t be empty';}
                          else {
                            return null;}
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(210, 170, 148,251 ),
                                blurRadius: 20.0,
                                offset:Offset(0,15)
                            ),]),
                      child: TextFormField(
                        onChanged: (value){},
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordcontroller,
                        obscureText: is_secure,
                        cursorColor: Colors.deepPurpleAccent ,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          prefixIcon: const Icon(Icons.lock,color:Colors.deepPurpleAccent,),
                          suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye,color:Colors.deepPurpleAccent,),
                            onPressed: () {
                              cubit.get(context).change_redeye();
                            },),
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
                          ),

                        ),
                        validator: (value){
                          if(value==null||value.isEmpty) {
                            return 'Please Fill That Field';}
                          else if(value.length<=8){
                            return 'Password is two short';
                          }
                          else {
                            return null;}
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 270,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(210, 170, 148,251 ),
                                    blurRadius: 30.0,
                                    offset:Offset(0,1)
                                )]
                          ),
                          child: ElevatedButton(onPressed: (){
                            if(formkey.currentState!.validate()){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>First()));
                            }
                          },
                            child:  Text('Login',
                              style:TextStyle(fontSize: 16) ,),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                              primary: Colors.deepPurpleAccent,
                              elevation: 15,
                            ),),
                        ),


                      ],
                    ),
                  )
                ],),
              ),
            )

        );
      }
      ,
    );
  }
}
