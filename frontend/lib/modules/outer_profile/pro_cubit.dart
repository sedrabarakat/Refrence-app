import 'dart:convert';


import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/modules/outer_profile/pro_states.dart';
import 'package:frontend/shared/network/local/shared_prefrence.dart';
import 'package:frontend/shared/network/remote/dio_helper.dart';
class pro_cubit extends Cubit<pro_states>{
  pro_cubit():super(pro_init());

 static pro_cubit get(context)=>BlocProvider.of(context);


 Map<String,dynamic>?outer;
 var dates=TextEditingController();
  var count=TextEditingController();
  bool ?isRate;
 bool ?isRed;
     bool again=false,reserve=false,next=false;
  int explength=0,constlength=0,counter=0;
  String? book_error,date_error;
 Future get_Outer({
  required int id,
})async{
   emit(pro_Loading_getprofile());
   return await dio_helper.getData(
       url: 'profile/$id',
       token:  'Bearer ${cache_helper.getData(key:'token')}'
   ).then((value){
     outer=jsonDecode(value.data);
     isRed=outer?['is_favorite'];
     explength=outer?['expert']['experience'].length;
     constlength=outer?['expert']['consultations'].length;
     isRate=outer?['is_rated_by_this_user'];
     //print(outer);
     emit(pro_Success_getprofile());
   }).catchError((error){
     print(error.toString());
     emit(pro_Error_getprofile(error.toString()));
   });
}

Future creat_fav({
  required int id
})async{
   emit(pro_Loading_create_fav());
   return await dio_helper.postData(url: 'favorite/create',
       token: 'Bearer ${cache_helper.getData(key: 'token')}',
       data: {
     'expert_id':id
   }).then((value){
     get_Outer(id: id).then((value){
       //isRed=true;
     });
     emit(pro_Success_create_fav());
   }).catchError((error){
     print(error.toString());
     emit(pro_Error_create_fav(error.toString()));
   });
}

Future delete_fav({
  required int id
})async{
  emit(pro_Loading_delete_fav());
  return await dio_helper.delete(url: 'favorite/delete',
      data: {'expert_id':id},
      token: 'Bearer ${cache_helper.getData(key: 'token')}').then((value){
      get_Outer(id:id);
       // isRed=false;
        emit(pro_Success_delete_fav());
  }).catchError((error){
      print(error.toString());
    emit(pro_Error_delete_fav(error.toString()));
  });

}

Future addrating({
  required int id,
  required int rating
})async{
   emit(pro_Loading_add_rating());
   return await dio_helper.postData(
       url: 'review/add',
   token:'Bearer ${cache_helper.getData(key: 'token')}' ,
   data: {
         'expert_id':id,
         'rating':rating
   }).then((value){
     get_Outer(id:id);
    // isRate=true;
     emit(pro_Success_add_rating());
   }).catchError((error){
    print(error.toString());
    emit(pro_Error_add_rating(error.toString()));
   });
}
  Future delete_rating({
    required int id,
  })async{
    emit(pro_Loading_delete_rating());
    return await dio_helper.delete(
        url: 'review/delete',
        token:'Bearer ${cache_helper.getData(key: 'token')}' ,
        data: {
          'expert_id':id,
        }).then((value){
          get_Outer(id:id);
          //isRate=false;
      emit(pro_Success_delete_rating());
    }).catchError((error){
      print(error.toString());
      emit(pro_Error_delete_rating(error.toString()));
    });
  }
void ret(){
  again=!again;
  emit( pro_Success_ret());
}

  void reserveclick(){
    reserve=!reserve;
    emit(pro_reserve_click());
  }

  List<dynamic>freetimes_bydate=[];
 Map<String,dynamic>?free_time_error;
  String ? ymd;
  Future get_freetimes_bydate({
  required int id,
  required String date,
   String ?years,
   String ?months,
   String ?days
})async{
   emit(pro_Loading_get_freetimes_bydate());
   await dio_helper.getData(url: 'get_free_times_with_booked_date',
       token: 'Bearer ${cache_helper.getData(key: 'token')}',
   query: {
     'expert_id':id,
    'date_of_chosen_day':date
   }
   ).then((value){
     //dates.text=date;
    freetimes_bydate=jsonDecode(value.data);
     ymd='$years-$months-$days';
    // print(freetimes_bydate);
     emit(pro_Success_get_freetimes_bydate());
   }).catchError((error){
     free_time_error=jsonDecode(error.response.data);
     print('message: ${free_time_error?['message']}');
     date_error='${free_time_error?['message']}';
    /* Fluttertoast.showToast(
         msg: "${date_error}",
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.red[900],
         textColor: Colors.white,
         fontSize: 16.0
     );*/
     emit(pro_Error_get_freetimes_bydate(error.toString()));
   });
  }


  Future book_date({
    required int id,
    required String date,
    required String start,
    required String hours_number,
})async{
    emit(pro_Loading_Book_Date());
    return await dio_helper.postData(
        url: 'add_booked_date',
        token:'Bearer ${cache_helper.getData(key: 'token')}' ,
        data: {
          'expert_id':id,
          'date_order_by_user':date,
          'start_time':start,
          'number_of_booked_hours':hours_number
        }).then((value){
         emit(pro_Success_Book_Date());
    }).catchError((error){
      Map<String,dynamic>?errors;
      errors=jsonDecode(error.response.data);
      book_error=errors?['message'];
      emit(pro_Error_Book_Date(error));
    });
  }
  void add_toCounter(){
    counter+=1;
    count.text=counter.toString();
    emit(pro_Success_adding_counter());
  }
  void minus_fromCounter(){
    if(counter>0){
    counter-=1;}
    count.text=counter.toString();
    emit(pro_Success_Minus_Counter());
  }
  void write_number(value){
    counter=value;
    count.text=value.toString();
    emit(pro_Success_write_Counter());
  }
  void nextreserve(){
    next=!next;
  }

  List<dynamic>allFreeTimes=[];
  Future get_allFreeTimes({
  required int id,
})async{
    emit(pro_Loading_AllFreeTime());
    dio_helper.getData(url: 'free_time/${id}',
        token:'Bearer ${cache_helper.getData(key: 'token')}' ).then((value){
      allFreeTimes=jsonDecode(value.data);
      emit(pro_Success_AllFreeTime());
    }).catchError((error){
      Map<String,dynamic>?Allerrors;
      Allerrors=jsonDecode(error.response.data);
      print(Allerrors?['message']);
      emit(pro_Error_AllFreeTime(error.toString()));

    });

  }




}