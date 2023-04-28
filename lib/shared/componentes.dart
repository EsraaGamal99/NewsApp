import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

Widget buildArticleItem(article)=> Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    children: [
      Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
         // color: Colors.black,
          image:
          DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: Container(
          height: 100.0,
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text('${article['title']}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              Text('${article['publishedAt']}'),
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget NewsScreenBuilder(list) =>
    ConditionalBuilder(
      condition: list.length>0,
      builder: (context)=>
          ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleItem(list[index]),
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey),
              itemCount: list.length),

      fallback: (context) => Center(child: CircularProgressIndicator()),
    );