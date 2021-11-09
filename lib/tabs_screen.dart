import 'package:flutter/material.dart';
import 'package:flutter_application_3/favorities_screen.dart';
import 'package:flutter_application_3/main_drawer.dart';
import './categories_screen.dart';
import 'meal.dart';
class TabsScreen extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final List<Meal>FavoriteMeals;
  TabsScreen(this.FavoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
//final List<Widget>_pages=[
   List<Map<String,Object>>_pages;
@override
void initState(){   //i put thisin init because it would allow widgrt to be used here
_pages=[
  {'page':CategoriesScreen(),'title':'Categories'},
 {'page':FavoritiesScreen(widget.FavoriteMeals),'title':'Your Favorities'},
];
  super.initState();
}
int _selectedPageIndex=0;
 void _selectPage(int index){
setState(() {
  _selectedPageIndex=index;
});
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text(_pages[_selectedPageIndex]['title']), 
      ),
      drawer:MainDrawer(),
      body:_pages[_selectedPageIndex]['page'],
      bottomNavigationBar:BottomNavigationBar(
        onTap:_selectPage,//it is flutter smartness that this will automatically pass index
        backgroundColor: Theme.of(context).primaryColor,  
        unselectedItemColor: Colors.white,
       selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,//we add this to tell class that it's current index
         type:BottomNavigationBarType.shifting,
         //we manulaly have to control which item to be selected in bottom navigation but not so in defaullt navigation
        
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            // ignore: deprecated_member_use
            icon:Icon(Icons.category),title:Text('Categories'),),
           BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
             icon:Icon(Icons.star),title:Text('Favorities'),),
        ],
      ),
    );

  }
}