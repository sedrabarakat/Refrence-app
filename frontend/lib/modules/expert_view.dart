

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;

import '../models/get_expert_view.dart';




class Experprofile extends StatefulWidget {
  const Experprofile({Key? key}) : super(key: key);

  @override
  State<Experprofile> createState() => _ExperprofileState();
}
class _ExperprofileState extends State<Experprofile> {
  Expertclass ?expertclass;
  @override

  Future f()async{
    http.Response response =
    await http.get(Uri.parse('http://10.0.2.2:8000/api/'));
    var data = jsonDecode(response.body);
    print(data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      elevation: 0,
      title: Text('Family expert', style: TextStyle(color: Colors.black),),
      leading:Icon(Icons.star, color: Colors.black,),
      backgroundColor: Colors.white,
    ),body: SingleChildScrollView(
          child: Container(width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Container(width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(onPressed: ()async{await f();}, icon: Icon(Icons.icecream)),
                    Container(

                      child: CircleAvatar(
                          radius: 50,
                          backgroundColor:Colors.grey
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Text("auth.expertclass", style: TextStyle(color: Colors.grey[800], fontSize: 25, fontWeight: FontWeight.bold),),
                              ), SizedBox(height: 5,),
                              Container(
                                child: Text('mohamad@gmail,com', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),),
                              ),
                              SizedBox(height: 16,),

                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(width: 1, color: Colors.grey),
                                    ),
                                    child: Center(
                                        child: Icon(Icons.facebook, color: Colors.blueGrey[400],)
                                    ),
                                  ),Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(width: 1, color: Colors.grey),
                                    ),
                                    child: Center(
                                        child: Icon(Icons.email, color: Colors.blueGrey[400],)
                                    ),
                                  ),Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(width: 1, color: Colors.grey),
                                    ),
                                    child: Center(
                                        child: Icon(Icons.whatsapp, color: Colors.blueGrey[400],)
                                    ),
                                  ),


                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(width: 1, color: Colors.grey),
                                    ),
                                    child: Center(
                                        child: Icon(Icons.call, color: Colors.blueGrey[400],)
                                    ),
                                  ),
                                ],
                              ) ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      child: Divider(
                        thickness: 1,
                        color: Colors.blueGrey[200],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('Syria', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),),
                              ),
                              Container(
                                child: Text('Country', style: TextStyle(fontSize: 15, color: Colors.blueGrey),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('Aleppo', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),),
                              ),
                              Container(
                                child: Text('City', style: TextStyle(fontSize: 15, color: Colors.blueGrey),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('Lucifer', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),),
                              ),
                              Container(
                                child: Text('Street', style: TextStyle(fontSize: 15, color: Colors.blueGrey),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Divider(
                        thickness: 1,
                        color: Colors.blueGrey[200],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text('About', style: TextStyle(fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.w900),),
                                  ),
                                  Container(
                                    child: Icon(Icons.favorite, color: Colors.red,),
                                  ),

                                ],
                              ),

                              Container(
                                  padding: EdgeInsets.only(top: 7),

                                  width: MediaQuery.of(context).size.width-80,
                                  child:Expanded(flex: 1,
                                    child: Text('The family is a basic unit of study in many medical and social science disciplines. Definitions of family have varied from country to country, and also within country,  for the purpose of study of the family as a factor in health and other variables of interest. A redefinition of a “family” has been proposed and various nuances of the definition are also discussed in detail. A classification scheme for the various types of family has also been put forward, in a bid to clarify the classification scheme further. ',
                                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily:AutofillHints.postalCode),

                                    ),
                                  )
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),


                  ]),
            ),
          )
      ));


  }}
