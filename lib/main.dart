import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/styles/bloc_observer.dart';

import 'layout/news_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  DioHelper.getData();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          //backwardsCompatibility: false,
          iconTheme: IconThemeData(
            color: Color(0xFF314F6A),
          ),
          elevation: 0.0,
         systemOverlayStyle: SystemUiOverlayStyle(
           statusBarColor: Colors.white,
         ),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Color(0xFF314F6A),
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF314F6A),
          type: BottomNavigationBarType.fixed,
          elevation: 25.0,
        ),
      ),
      home: NewsScreen(),
    );
  }
}
