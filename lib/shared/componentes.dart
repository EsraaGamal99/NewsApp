import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/web_view/web_view_screan.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

Widget buildArticleItem(article, context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(

        padding: const EdgeInsets.all(15.0),

        child: Row(

          children: [

            Container(

              height: 120.0,

              width: 120.0,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10.0),

                // color: Colors.black,

                image: DecorationImage(

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

                      child: Text(

                        '${article['title']}',

                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,

                        style: Theme.of(context).textTheme.bodyLarge,

                      ),

                    ),

                    Text('${article['publishedAt']}'),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),
);

Widget NewsScreenBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => Divider(color: Colors.grey),
          itemCount: list.length),
      fallback: (context) => isSearch? Container() : Center(child: CircularProgressIndicator()),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, screen) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
