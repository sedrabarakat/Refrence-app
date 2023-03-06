import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/modules/home.dart';
import 'package:frontend/modules/profiles/profile_cubit.dart';
import 'package:frontend/modules/search_id.dart';
import 'package:frontend/shared/bloc_observer.dart';
import 'package:frontend/widgets/agora.dart';
import 'package:frontend/widgets/proff.dart';
import 'layouts/main_page/main_page/cubit_main_page.dart';
import 'layouts/main_page/main_page/main_page.dart';
import 'modules/add_free_days.dart';
import 'modules/login.dart';
import 'modules/outer_profile/profile.dart';
import 'modules/search.dart';
import 'package:get/get.dart';
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
  else{
    startwidget=login();}
  runApp(MyApp(start:startwidget,));
}

class MyApp extends StatelessWidget {
  final Widget start;

  MyApp({super.key, required this.start});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) => cubit(),),
      BlocProvider(create: (BuildContext context) => profilecubit(),),
    ], child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:start,
        theme: ThemeData(
            /*scrollbarTheme: ScrollbarThemeData(
                isAlwaysShown: true,
                thickness: MaterialStateProperty.all(5),
                thumbColor: MaterialStateProperty.all(Color.fromARGB(
                    245, 210, 189, 230)),
                minThumbLength: 10,
                radius: const Radius.circular(20),
               ),*/
          timePickerTheme: TimePickerThemeData(
            backgroundColor: Colors.deepPurple[100],
             hourMinuteColor: Colors.grey[300],
            hourMinuteTextColor:  Colors.black,
            entryModeIconColor: Colors.black,
            dialHandColor:Colors.deepPurple,
            helpTextStyle: TextStyle(color: Colors.black,),
          ),
              colorScheme:  ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),

        ),

//start
    ),);
  }
}

