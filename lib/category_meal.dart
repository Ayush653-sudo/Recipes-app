import 'package:flutter/material.dart';
import 'package:flutter_application_3/meal_item.dart';

import './meal.dart';
class CategoryMealScreen extends StatefulWidget {
  static const routeName='/category-meals';
  final List<Meal>availableMeals;
  CategoryMealScreen(this.availableMeals);
  @override
  _CategoryMealScreenState createState()=>_CategoryMealScreenState();
  }
 // final String categoryid;
  // ignore: non_constant_identifier_names
 // final String CategoryTitle;
  //CategoryMealScreen(this.categoryid,this.CategoryTitle);
  class _CategoryMealScreenState extends State<CategoryMealScreen>{
    String categoryTitle;
    // ignore: non_constant_identifier_names
    
    List<Meal>displayedMeals;
    @override
    void initState(){
     
      
      
      
      super.initState();

    }
    @override
   void didChangeDependencies()//it did not place this code in init state because it is not able to acess context
     {                           //if context is not there then init state is good option to use.

     final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    // ignore: unused_local_variable
    
     categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];
     displayedMeals=widget.availableMeals.where((meal){

      return meal.categories.contains(categoryId);
    }).toList();
     

    super.didChangeDependencies();
   }
    
    void _removeMeal(String mealID){
setState(
  () {
  displayedMeals.removeWhere((meal)=>meal.id==mealID);
});
    }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(title:Text(categoryTitle),),
      body:ListView.builder(itemBuilder:(ctx,index)
      {
return MealItem(id:displayedMeals[index].id,title: displayedMeals[index].title, image: displayedMeals[index].imageUrl, affordability: displayedMeals[index].affordability, complexity: displayedMeals[index].complexity, duration: displayedMeals[index].duration,);

      },itemCount:displayedMeals.length,),
    
    
    );
  }
  }

