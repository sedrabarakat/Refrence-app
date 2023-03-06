import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/modules/outer_profile/pro_cubit.dart';
import 'package:frontend/modules/outer_profile/pro_states.dart';
import 'package:frontend/shared/network/local/shared_prefrence.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/styles.dart';

class pro_profile extends StatelessWidget{

  int id;
  pro_profile(this.id);



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>pro_cubit()..get_Outer(id: id)..get_allFreeTimes(id:id),
    child: BlocConsumer<pro_cubit,pro_states>(
      listener:(context,pro_states){
        if(pro_states is pro_Error_get_freetimes_bydate)
          MotionToast.error(
              position: MotionToastPosition.top,
              title:  Text("Warning",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              description:  Text("${pro_cubit.get(context).date_error}",style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.w400
              ),)
          ).show(context);
      } ,
      builder: (context,pro_states){
         ScrollController? scrollcontroller;
        var cubitcontext=context;
         var scroll=ScrollController();
         var scroll_book=ScrollController();
        var height=MediaQuery.of(context).size.height;
        var width=MediaQuery.of(context).size.width;
        bool ?red=pro_cubit.get(context).isRed;
        bool? isRate=pro_cubit.get(context).isRate;
        Map<String,dynamic>?outer=pro_cubit.get(context).outer;
        bool reserve=pro_cubit.get(context).reserve;
        String ?time;
        String ? ymd=pro_cubit.get(context).ymd;
        var scaffoldkey=GlobalKey<ScaffoldState>();
         var form=GlobalKey<FormState>();
        var dateController=pro_cubit.get(context).dates;
        var number_of_hours=pro_cubit.get(context).count;
        var timeController=TextEditingController();
        List<dynamic>?freetimes_bydate=pro_cubit.get(context).freetimes_bydate;
         List<dynamic>?All_freetime=pro_cubit.get(context).allFreeTimes;
        final _dialog = RatingDialog(
          initialRating: 0,
          enableComment: false,
          title: const Text(
            'Rating Me',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),

          message: const Text(
            'Hope that you like my services',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          // your app'cubitcontext logo?
          image: Container(
            height: height/4,width: width/7,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CachedNetworkImage(imageUrl: 'http://10.0.2.2:8000/storage/${outer?['image']}',
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ) ,),
          submitButtonText: 'Submit',
          submitButtonTextStyle: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,
              fontSize: 17),
          onCancelled: () => print('cancelled'),
          onSubmitted: (response) {
            pro_cubit.get(context).addrating(id: id, rating: response.rating.hashCode);
          },

        );
        final awsome_book= MaterialBanner(
            elevation: 0,
            backgroundColor: Colors.transparent,
            forceActionsBelow: true,
            content: AwesomeSnackbarContent(
            message:'${pro_cubit.get(context).book_error}',title: 'Warning',contentType: ContentType.success,inMaterialBanner: true,
          ), actions: const [SizedBox.shrink()],);
        Future pro_showDialogFlash()async{
        context.showFlashDialog(
          boxShadows:  [
            const BoxShadow(
                color: Color.fromARGB(210, 170, 148,251 ),
                blurRadius: 20.0,
                offset:Offset(0,15)
            ),],
          title: Text('Warning'),
          content: Text('your rating to this expert will be deleted, do you want to continue?',
            style: TextStyle(fontSize: 15),),
          negativeActionBuilder: (context, controller, _) {
            return  Row(children: [
              TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith((states){
                      return Colors.deepPurpleAccent.withOpacity(.2);}
                    )
                ),
                onPressed: () {
                  controller.dismiss();
                },
                child: Text("No",style: TextStyle(color: Colors.deepPurple),),
              ),
              TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith((states){
                      return Colors.deepPurpleAccent.withOpacity(.2);}
                    )
                ),
                onPressed: () {
              controller.dismiss();
              pro_cubit.get(cubitcontext).delete_rating(id: id).then((value){
                Fluttertoast.showToast(
                    msg: "The Rating has been Removed Successfully",
                    //toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red[800],
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                pro_cubit.get(cubitcontext).get_Outer(id: id);
              });
            },
            child: Text("Yes",style: TextStyle(color: Colors.deepPurple),),
            ),
            ],);
          },
        );}
         void notif(String msg){
          return MotionToast.error(
              position: MotionToastPosition.top,
              title:  Text("Warning",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              description:  Text("${msg}",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.w400
              ))
          ).show(context);
         }
        return Scaffold(
          body: SafeArea(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      color: Colors.blue.shade800.withOpacity(.4),
                      height: 110,
                      width: double.infinity,
                    )),
                ClipPath(
                    clipper: WaveClipperOne(),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [
                            0.1,
                            0.4,
                            0.8,
                          ],
                          colors: [
                            Colors.deepPurple.shade100.withOpacity(.5),
                            Colors.deepPurple.shade300,
                            Colors.deepPurple.shade400,
                          ])),
                      height: 110,
                      width: double.infinity,
                    )),
                ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                     // color: Colors.deepPurpleAccent.withOpacity(.4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: const [
                            0.1,0.2,
                          ],
                          colors: [
                            Colors.deepPurpleAccent.shade200.withOpacity(.4),
                            Colors.deepPurpleAccent.shade400.withOpacity(.4),
                          ])),
                      height: 140,
                      width: double.infinity,
                    )),
              SingleChildScrollView(
                child: Stack(
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 170),
                    child: Container(
                      width: double.infinity,
                      height: (reserve)?height*1.5:height,
                       decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 157, 169, 226),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50),
                          )),
                      child: ConditionalBuilder(
                        condition: true,
                        builder:(context){
                          if(reserve==false) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 130,),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Text('${outer?['first_name']} ${outer?['last_name']}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold
                                      )
                                      ,),
                                  ),
                                ),
                                const SizedBox(height: 30,),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(children: [
                                        const Icon(Icons.location_on),
                                        const SizedBox(width: 10,),
                                        Container(
                                          width: width/2,
                                          child: Text('${outer?['expert']['country']},${outer?['expert']['city']},${outer?['expert']['street']}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontFamily: 'RobotoMono',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400
                                            )
                                            ,),
                                        ),
                                      ],),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 10,left: width/5),
                                      child: Container(
                                        width: width/6,
                                        child: Text('${outer?['expert']['hour_charging']} \$',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                          )
                                          ,),
                                      ),
                                    ),
                                  ],),
                                const SizedBox(height: 25,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: SizedBox(
                                    height: 25,
                                    child: RatingBarIndicator(
                                      rating: (outer?['rating_by_this_user']==null)?0.0:outer?['rating_by_this_user']+0.0,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 50.0,
                                      direction: Axis.horizontal,
                                    ),),
                                ),
                                const  SizedBox(height: 30,),
                                const Padding(
                                  padding:  EdgeInsets.only(left: 25),
                                  child: Text('Expert\'s Consultations',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'AvenirLight'
                                      )),),
                                const SizedBox(height: 20,),
                                SizedBox(
                                  height: height/8,
                                  child: ConditionalBuilder(
                                    condition: pro_cubit.get(context).constlength>0,
                                    builder:(context)=> ListView.separated(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context,index)=> Consultations_by_id(outer?['expert']['consultations'][index],width),
                                        separatorBuilder:(context,index)=>const SizedBox() ,
                                        itemCount: pro_cubit.get(context).constlength),
                                    fallback: (context)=>Center(child:Lottie.asset('assets/animation/loading.json')),
                                  ),),
                                const SizedBox(height: 30,),
                                const Padding(
                                  padding:  EdgeInsets.only(left: 25),
                                  child: Text('Expert\'s Experiences',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'AvenirLight'
                                      )),),
                                const SizedBox(height: 10,),
                                SizedBox(
                                  height: height/4.3,
                                  child: ConditionalBuilder(
                                    condition:pro_cubit.get(context).explength>0,
                                    builder:(context)=> ListView.separated(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context,index)=> pro_experince(outer?['expert']['experience'],index),
                                        separatorBuilder:(context,index)=>const SizedBox() ,
                                        itemCount: pro_cubit.get(context).explength),
                                    fallback: (context)=>Center(child:Lottie.asset('assets/animation/loading.json')),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Center(
                                  child: ElevatedButton(onPressed: (){
                                    pro_cubit.get(context).reserveclick();
                                  }, child: Text('Reserve'),
                                    style: ElevatedButton.styleFrom(
                                      shadowColor:Colors.purpleAccent,
                                      minimumSize: Size(width/1.8, height/20),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      primary: Colors.deepPurple,
                                      disabledBackgroundColor: Colors.deepPurple,
                                      disabledForegroundColor: Colors.purpleAccent,
                                    ),),
                                )
                              ],);
                          } else {
                            return Column(
                              children: [
                                 SizedBox(height: height/4.7,),
                                ConditionalBuilder(
                                    condition: pro_cubit.get(context).allFreeTimes.length>0,
                                    builder: (context)=>Container(
                                      height: height/2.8,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:(context,index)=>all_free_time(height,index,All_freetime),
                                      separatorBuilder: (context,index)=>SizedBox(width: 10,),
                                      itemCount:pro_cubit.get(context).allFreeTimes.length ),
                                    ),
                                    fallback: (context)=> Container()),
                                SizedBox(height: height/30,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 25),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromARGB(210, 170, 148,251 ),
                                              blurRadius: 20.0,
                                              offset:Offset(0,15)
                                          ),]),
                                    child: TextFormField(
                                      onTap:  (){
                                        showDatePicker(context: context,
                                            builder: (context, child) {
                                              return Theme(
                                                data: Theme.of(context).copyWith(
                                                  colorScheme: ColorScheme.light(
                                                    primary: Colors.purple, //outer color
                                                    onPrimary: Colors.white, //text
                                                    onSurface: Colors.purple,//buttons
                                                  ),
                                                  textButtonTheme: TextButtonThemeData(
                                                    style: TextButton.styleFrom(
                                                      primary: Colors.purple, // button text color
                                                    ),),),
                                                child: child!,
                                              );
                                            },
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2023),
                                            lastDate: DateTime(2024)).then((date){
                                          // print(DateFormat('yyyy').format(value!));
                                          //print(DateFormat('MM').format(value!));
                                          //print(DateFormat('dd').format(value!));
                                          pro_cubit.get(context).get_freetimes_bydate(
                                              id: id,years: '${DateFormat('yyyy').format(date!)}',months:'${DateFormat('MM').format(date!)}' ,
                                              days:  '${DateFormat('dd').format(date!)}',
                                              date: '${(DateFormat('yyyy').format(date!))}:${(DateFormat('MM').format(date!))}:${(DateFormat('dd').format(date!))}').then((value){}).catchError((error){
                                              notif('Can\'t reach try again');
                                          });
                                        });
                                      },
                                        keyboardType: TextInputType.none,
                                      controller: dateController,
                                        cursorColor:Colors.purple,
                                        decoration: decoration.copyWith(
                                            labelText: 'Tap here to Pick a Date',
                                            prefixIcon: Icon(Icons.date_range,color: Colors.purple,)
                                        )
                                    ),
                                  ),
                                ),
                                ConditionalBuilder(
                                    condition: freetimes_bydate.length>0,
                                    builder: (context){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                   SizedBox(height: 10,),
                                    const Padding(
                                      padding:  EdgeInsets.only(left: 35),
                                      child: Text('Expert\'s Free Times',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'AvenirLight'
                                          )),),
                                    SizedBox(height: height/50,),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: width/15),
                                      child: Container(
                                        height: (freetimes_bydate.length==1)?height/8:height/3,
                                        child: CupertinoScrollbar(
                                          controller: scroll,
                                          radius: Radius.circular(20),
                                          thickness: 10,
                                          thumbVisibility:true,
                                          child: ListView.separated(
                                              controller: scroll,
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context,index)=>
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 30),
                                                    height: height/10,
                                                    decoration: BoxDecoration
                                                      (
                                                        borderRadius: BorderRadius.circular(35),
                                                        gradient: LinearGradient(
                                                            colors: [Colors.deepPurple.shade100,
                                                              Colors.deepPurple.shade200,Colors.deepPurple.shade400] )
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text('Free  From ',style: TextStyle(fontSize: 18,),),
                                                        Text('${freetimes_bydate[index][0]['start_time']} ',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                        SizedBox(width: 5,),
                                                        Text('To ',style: TextStyle(fontSize: 18,)),
                                                        Text('${freetimes_bydate[index][0]['end_time']}',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                                        Text('  Today',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                      ],),
                                                  ),
                                              separatorBuilder: (context,index)=>SizedBox(height: 20,),
                                              itemCount: freetimes_bydate.length),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height/60,),

                                    Padding(
                                        padding: const EdgeInsets.only(top:18,bottom:18,left:20),
                                      child: Container(
                                        height: height/8,
                                        decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromARGB(210, 170, 148,251 ),
                                                  blurRadius: 40.0,
                                                  offset:Offset(0,5)
                                              ),]
                                        ),
                                        child: ListView(
                                          shrinkWrap: false,
                                          physics: const NeverScrollableScrollPhysics(),
                                          controller: scroll_book,
                                          scrollDirection: Axis.horizontal,
                                          children: [Row(children: [
                                            SizedBox( width: width/1.5,
                                              child: Form(
                                                key: form,
                                                child: TextFormField(
                                                  validator: (value){
                                                    if(value==null||value.isEmpty) {
                                                      return 'please choose time';}
                                                  },
                                                    onTap:  (){
                                                      showTimePicker(
                                                        context: context,
                                                        builder: (context, child) {
                                                          return MediaQuery(
                                                            data: MediaQuery.of(context).copyWith(
                                                              // Using 24-Hour format
                                                                alwaysUse24HourFormat: true), child: child!,);
                                                        },
                                                        initialTime: TimeOfDay.now(),
                                                      ).then((value){
                                                        time=value.toString()[10]+value.toString()[11]+value.toString()[12]+value.toString()[13]+value.toString()[14];
                                                        cache_helper.saveData(key: 'time', value: time);
                                                        timeController.text=time!;
                                                        print(time);
                                                      });
                                                    },
                                                    keyboardType: TextInputType.none,
                                                    controller: timeController,
                                                    cursorColor:Colors.purple,
                                                    decoration: decoration.copyWith(
                                                        labelText: 'choose time to reserve',
                                                        prefixIcon: Icon(Icons.access_time_filled,color: Colors.purple,)
                                                    )
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Container(
                                              height: height/16,width: width/5,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                                              child: TextButton(
                                                onPressed: (){
                                                  if(form.currentState!.validate())
                                                  scroll_book.animateTo(500, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn );
                                                  //pro_cubit.get(context).book_date(id: id, date: ymd.toString(), start: time.toString(), hours_number: pro_cubit.get(context).counter.toString());
                                                }, child: Text('Next',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),style: ButtonStyle(
                                                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.purple),

                                              ),),
                                            ),

                                            SizedBox(width: width/40,),
                                            Container(
                                              width: width/13,
                                              child: MaterialButton(
                                                  onPressed: (){ scroll_book.animateTo(-500, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn );
                                                  },
                                                  child: Icon(Icons.arrow_back_ios,size: 20,
                                                    color: Colors.purple[800],)),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30)),
                                              child: MaterialButton(
                                                  onPressed: (){
                                                    pro_cubit.get(context).minus_fromCounter();
                                                  },shape: CircleBorder(side:BorderSide.none),
                                                  child: Icon(Icons.remove_circle,size: 30,
                                                    color: Colors.red[800],)),

                                            ),
                                            Container(width: width/4,
                                              decoration: const BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(210, 170, 148,251 ),
                                                        blurRadius: 20.0,
                                                        offset:Offset(0,15)
                                                    ),]),
                                              child:TextFormField(
                                                  onFieldSubmitted: (value){
                                                    pro_cubit.get(context).write_number(int.parse('${value}'));
                                                  },
                                                  onChanged: (value){ pro_cubit.get(context).write_number(int.parse('${value}'));},
                                                  keyboardType: TextInputType.number,
                                                  controller: number_of_hours,
                                                  cursorColor:Colors.purple,
                                                  decoration: decoration.copyWith(
                                                      labelText: 'Number of hour',
                                                      prefixIcon: Icon(Icons.hourglass_full_rounded,color: Colors.purple,)
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30)),
                                              child: MaterialButton(
                                                  onPressed: (){
                                                    pro_cubit.get(context).add_toCounter();
                                                  },shape: CircleBorder(side:BorderSide.none),
                                                  child: Icon(Icons.add_circle,size: 30,
                                                    color: Colors.deepPurple[800],)),

                                            ),
                                            Container(
                                              height: height/16,width: width/5,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                                              child: TextButton(
                                                onPressed: (){
                                                  print(cache_helper.getData(key: 'time'));
                                                  pro_cubit.get(context).book_date(id: id, date: ymd.toString(), start: cache_helper.getData(key: 'time').toString(), hours_number: pro_cubit.get(context).counter.toString()).then((value){
                                                   // showDialog(context: context, builder: (context)=>awsome_book);
                                                    MotionToast.success(
                                                        position: MotionToastPosition.top,
                                                        title:  Text("Successfully",style: TextStyle(
                                                            fontSize: 18,fontWeight: FontWeight.bold
                                                        )),
                                                        description:  Text("We are waiting you on the time ",style: TextStyle(
                                                            fontSize: 18,fontWeight: FontWeight.w400
                                                        ))
                                                    ).show(context);
                                                  }).catchError((error){
                                                    notif('${pro_cubit.get(context).book_error}');
                                                   // showDialog(context: context, builder: (context)=>awsome_book);
                                                  });
                                                }, child: Text('Book',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),style: ButtonStyle(
                                                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.purple),

                                              ),),
                                            ),
                                            SizedBox(width: 15,)

                                          ],),]
                                        ),
                                      ),
                                    )
                                  ],);},
                                    fallback: (context)=>SizedBox()),
                                Center(
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(),
                                    child: ElevatedButton(
                                      onPressed: (){
                                      pro_cubit.get(context).reserveclick();
                                    //  pro_cubit.get(context).book_date(id: id,start: '20:00',date: '2023-02-14',hours_number: '1');
                                    }, child: Text('Back to profile'),
                                      style: ElevatedButton.styleFrom(
                                        shadowColor:Colors.purpleAccent,
                                        minimumSize: Size(width/1.8, height/20),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        primary: Colors.deepPurple,
                                        disabledBackgroundColor: Colors.deepPurple,
                                        disabledForegroundColor: Colors.purpleAccent,
                                      ),),
                                  ),
                                ),

                              ],
                            );
                          }
                        } ,
                        fallback:(context)=>SizedBox() ,
                      ),

                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 80,left: width/3.5),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: CachedNetworkImage(imageUrl: 'http://10.0.2.2:8000/storage/${outer?['image']}',
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress,color: Colors.deepPurple,),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                    ),
                  ),
                  Positioned(
                    top: 220,
                    right: 115,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple.shade200,
                                Colors.deepPurple.shade500,
                              ]
                          ),
                          borderRadius: BorderRadius.circular(80)),
                      child: IconButton(onPressed: (){

                      }, icon:  const Icon(Icons.message)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 220,left: 175),
                    child: Container(
                      height: 65,width: 65,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple.shade200,
                                Colors.deepPurple.shade500,
                              ]
                          ),
                          borderRadius: BorderRadius.circular(80)),
                      child: IconButton(
                          onPressed: (){
                        if(red==false){
                          pro_cubit.get(context).creat_fav(id: id).then((value){
                            Fluttertoast.showToast(
                                msg: "added successfully",
                                //toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.deepPurple[800],
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }).catchError((error){
                            Fluttertoast.showToast(
                              msg: "Error",
                             // toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.deepPurple[800],
                              textColor: Colors.white,
                              fontSize: 16.0
                          );});
                        }
                          else if(red==true){
                            pro_cubit.get(context).delete_fav(id: id).then((value){
                              Fluttertoast.showToast(
                                msg: "Removed successfully",
                                //toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red[800],
                                textColor: Colors.white,
                                fontSize: 16.0
                            );}).catchError((error){
                              Fluttertoast.showToast(
                                  msg: "Error",
                                  //toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.deepPurple[800],
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            });
                          }}, icon: Icon((red==true)?Icons.favorite:Icons.favorite_border,size: 30,color: Colors.red[900],)),),
                  ),
                  Positioned(
                    top: 220,
                    left: 120,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple.shade200,
                                Colors.deepPurple.shade500,
                              ]
                          ),
                          borderRadius: BorderRadius.circular(80)),
                      child: IconButton(onPressed: (){
                        if(isRate==false){
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => _dialog,
                        ).then((value) => pro_cubit.get(cubitcontext).get_Outer(id: id));}
                        else if(isRate==true) {
                          pro_showDialogFlash();
                        }
                        }, icon:   Icon((isRate==true)?Icons.star:Icons.star_border,color: Colors.amber[600])
                      ),),
                  ),
                    Positioned(
                      left: width/30,top: height/50,
                      child: CircleAvatar(backgroundColor: Color.fromARGB(
                          255, 124, 75, 222),
                          radius: 20,
                          child: IconButton(onPressed: (){Navigator.pop(context);},icon:  const Icon(Icons.arrow_back),
                          )),
                    ),
                ],),
              )

              ],),
          ),
        );
      },
    ),);
  }
}