import 'package:flutter/material.dart';
import 'meal.dart';
import './meal_item.dart';
class FavoritiesScreen extends StatelessWidget {
  final List<Meal>favoriteMeals;
FavoritiesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
    return Center(child:Text('HEY YOU HAVE NOT ANY FAVORITIES!!'),);
    }
    else{
      return ListView.builder(itemBuilder:(ctx,index)
      {
return MealItem(id:favoriteMeals[index].id,title: favoriteMeals[index].title, image: favoriteMeals[index].imageUrl, affordability: favoriteMeals[index].affordability, complexity: favoriteMeals[index].complexity, duration: favoriteMeals[index].duration,);

      },itemCount:favoriteMeals.length,);
    
    }
  
  }
}