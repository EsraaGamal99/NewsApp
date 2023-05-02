import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/styles/bloc_observer.dart';

import 'layout/news_layout.dart';
import 'network/local/cach_helper.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getBoolean(key: 'isDark');


  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {

  final bool isDark;

   MyApp(this.isDark);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusinessData()..changeThemeMode(modeFromShared: isDark,),
      child: BlocConsumer<AppCubit,NewsStates>(
        listener: (context, state){},
        builder: (context, state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Color(0xFF314F6A),
                ),
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,

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
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,

            darkTheme: ThemeData(
              primarySwatch: Colors.blueGrey,
              scaffoldBackgroundColor: Color(0xFF333739),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Colors.grey,
                ),
                elevation: 20.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: Color(0xFF333739),
                ),
                backgroundColor: Color(0xFF333739),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color(0xFF333739),
                type: BottomNavigationBarType.fixed,
                elevation: 25.0,
                selectedIconTheme: IconThemeData(color:Colors.blueGrey, ),
                unselectedIconTheme: IconThemeData(color:Colors.grey, ),
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            home: NewsScreen(),
          );

        },
      ),
    );
  }
}
