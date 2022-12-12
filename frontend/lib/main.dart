import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/shared/bloc_observer.dart';

import 'layouts/main_page/main_page/cubit_main_page.dart';
import 'layouts/main_page/main_page/main_page.dart';
import 'modules/login.dart';
import 'shared/network/local/shared_prefrence.dart';
import 'shared/network/remote/dio_helper.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dio_helper.init();
  await cache_helper.init();
  Bloc.observer=MyBlocObserver();
  String?token=cache_helper.getData(key: 'token');
  Widget? startwidget;
  if(token!=null){
    startwidget=First();
  }
  else{startwidget=login();}
  runApp(MyApp(start:startwidget,));
}

class MyApp extends StatelessWidget {
  final Widget start;
  MyApp({super.key,required this.start});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>cubit()..getexpert(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: start,
      ),
    );
  }
}

