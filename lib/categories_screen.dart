import 'package:flutter/material.dart';
import 'package:flutter_application_3/category_item.dart';
import 'package:flutter_application_3/dummy_data.dart';
import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
children: DUMMY_CATEGORIES.map((catData)=>CategoryItem(
  catData.id,
  catData.title,
  catData.color,
  )).toList(),
  gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
    
maxCrossAxisExtent: 200,
childAspectRatio:3/2,
crossAxisSpacing:20,
mainAxisSpacing: 20,
  ),


    );
  }
}