
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:frontend/layouts/main_page/main_page/cubit_main_page.dart';
import 'package:frontend/layouts/main_page/main_page/states_mainpage.dart';
import 'package:lottie/lottie.dart';

import '../shared/components/components.dart';

Widget Search() {

  return BlocProvider(
    create: (context)=>cubit(),
    child: BlocConsumer<cubit,layout_state>(
      listener:(context,layout_state){} ,
      builder: (context,layout_state){
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        var searchcontroller=TextEditingController();
        bool on=false;
        List<dynamic>Searchexpert=cubit.get(context).searchexpertlist;
        List<dynamic>SearchConsultation=cubit.get(context).Consultationlist;
        List<dynamic>Consultation_byid=cubit.get(context).expert_list_id;
        return  SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    clipBehavior:Clip.antiAlias ,
                    height: height/5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/blue.jpeg'),fit: BoxFit.fill
                      ),
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade100,Colors.blue.shade100,Colors.blue.shade300,Colors.blue.shade400]
                      ),),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),),),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45.0,left: 20,right: 10),
                    child:  Row(
                        children: [
                          Container(
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(199, 8, 0, 255),
                                      blurRadius: 30.0,
                                      offset:Offset(0,1)
                                  )]),
                            child: ElevatedButton(onPressed: (){

                               cubit.get(context).change_color1();

                            },
                              child:Text('Search by name',
                                style:TextStyle(fontSize: 17) ,),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                primary: (cubit.get(context).color1)?Colors.deepPurpleAccent:Colors.blue,
                                elevation: 15,
                              ),),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(197, 8, 0, 255),
                                      blurRadius: 30.0,
                                      offset:Offset(0,1)
                                  )]),
                            child: ElevatedButton(onPressed: (){
                              cubit.get(context).change_color2();
                            },
                              child:Text('Search by consultation',
                                style:TextStyle(fontSize: 16) ,),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                primary: (cubit.get(context).color2)?Colors.deepPurpleAccent:Colors.blue,
                                elevation: 15,
                              ),),),],),

                  ),),
              ],),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(250, 120, 198,251 ),
                            blurRadius: 20.0,
                            offset:Offset(0,15)
                        ),]),
                  child: TextFormField(
                    onChanged: (value){},
                    keyboardType: TextInputType.text,
                    controller: searchcontroller,
                    cursorColor: Colors.deepPurpleAccent ,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      prefixIcon: const Icon(Icons.search,color:Colors.blue,),
                      labelText: 'Search here',
                      labelStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'AvenirLight'
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(50),),
                      enabledBorder: OutlineInputBorder(borderSide:const BorderSide(
                        color: Colors.white,),
                          borderRadius: BorderRadius.circular(50)
                      ),

                    ),
                    onFieldSubmitted: (value){
                     // cubit.get(context).expert_search(expert_name: searchcontroller.text.toString());
                      if(cubit.get(context).color1==true){
                        cubit.get(context).expert_search(expert_name: searchcontroller.text.toString());
                      }
                     else if(cubit.get(context).color2==true){
                        cubit.get(context).Consultation_search(Consultation_name: searchcontroller.text.toString());

                      }
                     else{
                        cubit.get(context).expert_search(expert_name: searchcontroller.text.toString());
                      }

                    },
                    validator: (value){
                      if(value==null||value.isEmpty) {
                        return 'Please Fill That Field';}
                      else {
                        return null;}
                    },
                  ),),
              ),

              ConditionalBuilder(
                  condition: Searchexpert.length>0||SearchConsultation.length>0,
                  builder: (context)=>(cubit.get(context).color1)?Container(height: height/1.9,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context,index)=>Searchcell(context,Searchexpert[index],index),
                        separatorBuilder: (context,index)=>SizedBox(height: 5,),
                        itemCount: Searchexpert.length),
                  ): Container(
                    height: height/1.9,
                    child: ListView.separated(
                        shrinkWrap: true,
                        //Consultation_byid[0][index]['normal_user']
                        itemBuilder: (context,index)=>Consultation(SearchConsultation[index],context),
                        separatorBuilder: (context,index)=>SizedBox(height: 5,),
                        itemCount: SearchConsultation.length),
                  ),
                  fallback: (context)=>Center(child:Lottie.asset('assets/animation/search-users.json')))

            ],),
        );

      },),
  );
//(context)=>Center(child:Lottie.asset('assets/animation/search-users.json')))
}
