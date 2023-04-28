import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/settings_screen.dart';
import 'package:news_app/modules/sports_screen.dart';

import '../network/remote/dio_helper.dart';

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
  if(currentIndex==1)
    getSportsData();
  else if(currentIndex==2)
    getScienceData();
}

List <dynamic> business =[];
void getBusinessData() {
  emit(NewsGetBusinessLoadingState());
  DioHelper.getData(
    url: 'v2/top-headlines',
    query:
    {
      'country':'us',
      'category':'business',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
    },
  ).then((value) {
    business = value.data['articles'];
    print(business[0]['title']);

    emit(NewsGetBusinessDataSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessDataErrorState(error.toString()));
  });
}

List <dynamic> sports =[];
  void getSportsData() {
    emit(NewsGetSportsLoadingState());
   if(sports.length==0){
     DioHelper.getData(
       url: 'v2/top-headlines',
       query:
       {
         'country':'us',
         'category':'sports',
         'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
       },
     ).then((value) {
       sports = value.data['articles'];
       print(sports[0]['title']);

       emit(NewsGetSportsDataSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(NewsGetSportsDataErrorState(error.toString()));
     });
   } else{
     emit(NewsGetSportsDataSuccessState());

   }
  }

List <dynamic> science =[];
  void getScienceData() {
    emit(NewsGetScienceLoadingState());
    if(science.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'us',
          'category':'science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceDataSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceDataErrorState(error.toString()));
      });
    } else{
      emit(NewsGetScienceDataSuccessState());
    }
  }
}