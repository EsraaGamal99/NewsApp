import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

import '../shared/componentes.dart';

class SciencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, NewsStates>(
      listener: (context, state) {},

      builder: (context, state)
      {
      var list = AppCubit.get(context).science;
        //AppCubit cubit = AppCubit.get(context);
        return NewsScreenBuilder(list,context);
      },);
  }}
