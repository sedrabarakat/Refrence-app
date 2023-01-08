import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/search_id.dart';
import 'package:frontend/shared/bloc_observer.dart';
import 'layouts/main_page/main_page/cubit_main_page.dart';
import 'layouts/main_page/main_page/main_page.dart';
import 'modules/BUTTON.dart';
import 'modules/login.dart';
import 'modules/search.dart';
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

  MyApp({super.key, required this.start});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) => cubit()..getexpert(),),
      BlocProvider(create: (BuildContext context) => profilecubit()..getprofile()..get_booked_date(),),
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home:start
//start
    ),);
  }
}

