import 'package:flutter/material.dart';

Widget cell(expertlist){

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
            colors: [Colors.cyan.shade200,Colors.deepPurple.shade300]
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 9,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    image:  DecorationImage(

                        image: NetworkImage('http://10.0.2.2:8000/storage/${expertlist['image']}'))
                )),
            SizedBox(width: 5,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${expertlist['first_name']} ${expertlist['last_name']}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        )),
                    SizedBox(height: 10,),
                    Text('Psychological counselor',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15
                        )),
                    SizedBox(height: 10,),
                    Row(children: [
                      Icon(Icons.star_rate,size: 18,color: Colors.deepPurple,),
                      SizedBox(width: 5,),
                      Text('rated as 4 stars ',
                          style: TextStyle(
                              color: Colors.deepPurple.shade900,
                              fontWeight: FontWeight.w400,
                              fontSize: 18
                          ))
                    ],)
                  ],),
              ),
            )
          ],),
      ),
    ),
  );
}//Colors.cyan.shade300,Colors.purple.shade200,Colors.deepPurple.shade300



TextEditingController defalutcontroller(){
  var controller=TextEditingController();
  return controller;
}

