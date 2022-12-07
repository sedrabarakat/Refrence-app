import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layouts/main_page/cubit_main_page.dart';
import 'modules/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>cubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: login(),
      ),
    );
  }
}


