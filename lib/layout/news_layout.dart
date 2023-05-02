import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,NewsStates>(
      listener: (context, state) {} ,
      builder: (context, state) {
        AppCubit cubit =AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(onPressed: (){},icon: Icon(Icons.search,),),
              IconButton(onPressed: (){
                AppCubit.get(context).changeThemeMode();
              },icon: Icon(Icons.brightness_4_outlined,),),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
          currentIndex: cubit.currentIndex,
          onTap: (index){
                cubit.changeBottomNavBar(index);
          },
          ),
        );
      },
    );
  }
}
