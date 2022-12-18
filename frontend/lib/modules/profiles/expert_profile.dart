import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/profiles/profiles_states.dart';


Widget expert_profile(){

    var scaffoldkey= GlobalKey<ScaffoldState>();
    var phonecontroller=TextEditingController();
    var walletcontroller=TextEditingController();
    var countrycontroller=TextEditingController();
    var citycontroller=TextEditingController();
    var streetcontroller=TextEditingController();


    return BlocConsumer<profilecubit,profile_state>(
      listener: (context,profile_state){},
      builder: (context,profile_state){
        bool isOpen=false;
        File? imageFile=profilecubit.get(context).imageFile;
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        return Scaffold(
          key: scaffoldkey,
          backgroundColor: Colors.grey[300],

          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/image/conntact.jpg'),
                  )),),
             SingleChildScrollView(
               child: Stack(children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 185,),  //background_container
                   child: Stack(alignment: Alignment.topCenter,
                     children: [
                       Container(
                         height: height*1.1,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: Colors.deepPurple[100],
                           borderRadius: const BorderRadius.only(
                               topRight: Radius.circular(40),
                               topLeft: Radius.circular(40)
                           ),
                         ),

                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical:60 ,horizontal:10 ),
                         child: Column(
                           children: [
                             const SizedBox(height: 10,),

                             Padding(
                               padding: const EdgeInsets.only(top: 30),
                               child: Expanded(
                                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     const SizedBox(width: 25,),
                                     const Text('Sedra Barakat',
                                       overflow: TextOverflow.ellipsis,
                                       maxLines: 1,
                                       style: TextStyle(
                                           fontSize: 24,
                                           fontWeight: FontWeight.bold
                                       ),),
                                     IconButton(onPressed: (){}, icon: const Icon(Icons.edit))
                                   ],),
                               ),),
                             const SizedBox(height: 15,),
                             Container(
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
                                   onChanged: (value){},
                                   keyboardType: TextInputType.phone,
                                   controller: phonecontroller,
                                   cursorColor: Colors.deepPurpleAccent ,
                                   decoration: InputDecoration(
                                     filled: true,
                                     fillColor: Colors.grey[100],
                                     prefixIcon: const Icon(Icons.phone,color:Colors.deepPurpleAccent ,),
                                     labelText: 'phone number',
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
                                     if(value==null||value.isEmpty) {
                                       return 'this field shouldn\'t be empty';}
                                     else {
                                       return null;}
                                   },
                                 ),
                               ),
                             ),
                             const SizedBox(height: 15,),
                             Container(
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
                                   onChanged: (value){},
                                   keyboardType: TextInputType.text,
                                   controller: countrycontroller,
                                   cursorColor: Colors.deepPurpleAccent ,
                                   decoration: InputDecoration(
                                     filled: true,
                                     fillColor: Colors.grey[100],
                                     prefixIcon: const Icon(Icons.location_on,color:Colors.deepPurpleAccent ,),
                                     labelText: 'Country',
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
                                     if(value==null||value.isEmpty) {
                                       return 'this field shouldn\'t be empty';}
                                     else {
                                       return null;}
                                   },
                                 ),
                               ),
                             ),
                             const SizedBox(height: 15,),
                             Container(
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
                                   onChanged: (value){},
                                   keyboardType: TextInputType.text,
                                   controller: citycontroller,
                                   cursorColor: Colors.deepPurpleAccent ,
                                   decoration: InputDecoration(
                                     filled: true,
                                     fillColor: Colors.grey[100],
                                     prefixIcon: const Icon(Icons.location_city_sharp,color:Colors.deepPurpleAccent ,),
                                     labelText: 'City',
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
                                     if(value==null||value.isEmpty) {
                                       return 'this field shouldn\'t be empty';}
                                     else {
                                       return null;}
                                   },
                                 ),
                               ),
                             ),
                             const SizedBox(height: 15,),
                             Container(
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
                                   onChanged: (value){},
                                   keyboardType: TextInputType.text,
                                   controller: streetcontroller,
                                   cursorColor: Colors.deepPurpleAccent ,
                                   decoration: InputDecoration(
                                     filled: true,
                                     fillColor: Colors.grey[100],
                                     prefixIcon: const Icon(Icons.home,color:Colors.deepPurpleAccent ,),
                                     labelText: 'phone number',
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
                                     if(value==null||value.isEmpty) {
                                       return 'this field shouldn\'t be empty';}
                                     else {
                                       return null;}
                                   },
                                 ),
                               ),
                             ),
                             const SizedBox(height: 15,),
                             Container(
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
                                   readOnly: true,
                                   onChanged: (value){},
                                   keyboardType: TextInputType.number,
                                   controller: walletcontroller,
                                   cursorColor: Colors.deepPurpleAccent ,
                                   decoration: InputDecoration(
                                     filled: true,
                                     fillColor: Colors.grey[100],
                                     prefixIcon: const Icon(Icons.wallet,color:Colors.deepPurpleAccent ,),
                                     labelText: 'Wallet',
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
                                   ),),

                               ),
                             ),
                             const SizedBox(height: 15,),
                             Container(
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
                                   readOnly: true,
                                   onChanged: (value){},
                                   keyboardType: TextInputType.number,
                                   controller: walletcontroller,
                                   cursorColor: Colors.deepPurpleAccent ,
                                   decoration: InputDecoration(
                                     filled: true,
                                     fillColor: Colors.grey[100],
                                     prefixIcon: const Icon(Icons.timer_rounded,color:Colors.deepPurpleAccent ,),
                                     labelText: 'Charging Hour',
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
                                   ),),

                               ),
                             ),
                             const SizedBox(height: 20,),
                             Container(
                               width: 200,
                               child: ElevatedButton(onPressed: (){},
                                   child:Text('Update Profile',
                                     style:TextStyle(fontSize: 16) ,),
                                   style: ElevatedButton.styleFrom(
                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                     primary: Colors.deepPurple[500],
                                     elevation: 15,
                                   )),
                             ),
                             const SizedBox(height: 10,),
                             Container(
                               width: 200,
                               child: ElevatedButton(onPressed: (){},
                                   child:Text('Delete Your Profile',
                                     style:TextStyle(fontSize: 16) ,),
                                   style: ElevatedButton.styleFrom(
                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                     primary: Colors.red[900],
                                     elevation: 15,
                                   )),
                             )




                           ],),
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 110,left: 130,right: 130),
                   child: Stack(  //user_image
                       alignment: Alignment.bottomRight,
                       children:[
                         Container(
                           height: height/5.8,
                           width: width/1.5,
                           clipBehavior: Clip.hardEdge,
                           decoration:BoxDecoration(
                             color: Colors.deepPurple,
                             borderRadius: BorderRadius.circular(140),
                           ),
                           child: imageFile==null?Image.asset('assets/image/expert.jpg'
                             ,fit: BoxFit.scaleDown,
                           ):
                           Image.file(
                             imageFile,
                             fit: BoxFit.cover,
                           ),),
                         Container(
                           width: 40,
                           height: 40,
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(50)
                           ),
                           child: IconButton(onPressed: (){
                             if(isOpen==false){
                               scaffoldkey.currentState?.showBottomSheet(
                                   backgroundColor: Colors.deepPurple[100],
                                       (context) => Container(
                                     decoration:  BoxDecoration(
                                         color: Colors.deepPurple[200],
                                         borderRadius: BorderRadius.only(
                                             topLeft: Radius.circular(50),
                                             topRight: Radius.circular(50)
                                         )
                                     ),
                                     width: double.infinity,height: 80,

                                     child: Row(
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.all(20.0),
                                           child: IconButton(onPressed: (){
                                             var fromCamera = profilecubit.get(context).getFromCamera();
                                           },
                                               icon: const Icon(Icons.camera,size: 30,)),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(20.0),
                                           child: IconButton(
                                               onPressed: (){
                                                 profilecubit.get(context).getFromGallery();
                                               },
                                               icon:Icon(Icons.photo_library,size: 30,)),
                                         )
                                       ],),)).closed.then((value){
                                 isOpen=false;  });
                               isOpen=true;}
                             else{
                               Navigator.pop(context);
                               isOpen=false;                    }
                           },
                               icon: Icon(Icons.cameraswitch,)),
                         )
                       ]),
                 ),
               ],),
             )

            ],
          ),);
      },
    );



}
