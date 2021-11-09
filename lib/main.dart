import 'package:flutter/material.dart';
import 'package:flutter_application_3/dummy_data.dart';
import 'package:flutter_application_3/filters_screen.dart';
import 'package:flutter_application_3/meal_detail_screen.dart';
// ignore: unused_import
import './categories_screen.dart';
import 'category_meal.dart';
import './tabs_screen.dart';
import './meal.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>_filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal>_availableMeals=DUMMY_MEALS;
  List<Meal>_favoriteMeals=[];
  void _setFilters(Map<String,bool>filterData){
    setState(() {
      _filters=filterData;
      _availableMeals=DUMMY_MEALS.where((meal){
     if(_filters['gluten'] && !meal.isGlutenFree){//it is magic of flutter that it will not include those items whose value is false 
       return false;
     }
     if(_filters['lactose'] && !meal.isLactoseFree){
       return false;
     }
      if(_filters['vegan'] && !meal.isVegan){
       return false;
     }
      if(_filters['vegetarian'] && !meal.isVegetarian){
       return false;
     }
     return true;
      }).toList();
    });
  }
  void _toggleFavorite(String mealId){
    final existingIndex=_favoriteMeals.indexWhere((meal)=>meal.id== mealId);
    if(existingIndex>=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });

    }
    else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id== mealId),);
      });
    }
  }
  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal)=>meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor:Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily:'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
         // ignore: deprecated_member_use
         body1:TextStyle(
           color:Color.fromRGBO(20, 51, 51, 1),
         ),
          //ignore: deprecated_member_use
        body2:TextStyle(
           color:Color.fromRGBO(20, 51, 51, 1),
         ),
      // ignore: deprecated_member_use
         title:TextStyle(fontSize:24,fontFamily:'RobotoCondensed',)
        ),
      ),
    
      routes:{
        '/': (ctx) => TabsScreen(_favoriteMeals),
        '/category-meals':(ctx)=>CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName:(ctx)=>MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeName:(ctx)=>FilterScreen(_filters,_setFilters),
      },
    );
  }
}


