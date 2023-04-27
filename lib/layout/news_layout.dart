import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=> AppCubit(),
      child: BlocConsumer<AppCubit,NewsStates>(
        listener: (context, state) {} ,
        builder: (context, state) {
          AppCubit cubit =AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
              ),
              actions: [Icon(Icons.search,),],
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
      ),
    );
  }
}
