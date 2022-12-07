import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/layouts/main_page/states_mainpage.dart';

import '../../modules/favorite.dart';
import '../../modules/home.dart';
import '../../modules/profile.dart';



class cubit extends Cubit<layout_state>{
  cubit():super(init_state());

  static cubit get(context)=>BlocProvider.of(context);
  var index=0;
  bool issecure=true;
  List <Widget>list=[
    favorite(),
    home(),
    profile()
  ];
  void on_Tap(int value){
    index=value;
    print(index);
    emit(change_index());
  }

  void change_redeye(){
    issecure=!issecure;
    print( issecure);
    emit(change_eyesuffix());
  }



}