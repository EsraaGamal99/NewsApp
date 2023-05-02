import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

import '../../shared/componentes.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,NewsStates>(
      listener: (context, state) =>{},
      builder: (context, state) {
        var list =AppCubit.get(context).search;
        return Scaffold(
        appBar: AppBar(),
        body: Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: defaultFormField(
          controller: searchController,
          type: TextInputType.text,
          validate: (String value){
          if(value.isEmpty)
          {
          return 'Search must not br empty';
          }
          else
          return null;
          },
          label: 'Search',
          prefix: Icons.search,
          onChange: (value){
          AppCubit.get(context).getSearch(value);
          },
          ),
        ),

          Expanded(child: NewsScreenBuilder(list,context,isSearch: true),),
    ],
    ),
    );
    }

    );
  }
}
