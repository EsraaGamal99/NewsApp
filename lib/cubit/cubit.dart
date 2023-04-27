import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/settings_screen.dart';
import 'package:news_app/modules/sports_screen.dart';

class AppCubit extends Cubit<NewsStates>{
  AppCubit(): super(NewsInitialState());
static AppCubit get(context)=> BlocProvider.of(context);

int currentIndex=0;

List<BottomNavigationBarItem> items=[
  BottomNavigationBarItem(icon: Icon(Icons.business_outlined),label: 'Business'),
  BottomNavigationBarItem(icon: Icon(Icons.sports_baseball),label: 'Sports'),
  BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: 'Science'),
  BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),



];
List<Widget> screens =[
  BusinessScreen(),
  SportsScreen(),
  SciencesScreen(),
  SettingsScreen(),
];

void changeBottomNavBar(int index){
  currentIndex = index;
  emit(NewsBottomNavBarState());
}
}