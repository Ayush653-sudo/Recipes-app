import 'package:flutter/material.dart';
import 'package:flutter_application_3/main_drawer.dart';
class FilterScreen extends StatefulWidget {
  
static const routeName='/filters';
final Function saveFilters;
final Map<String,bool>currentFilters;
FilterScreen(this.currentFilters,this.saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree=false;
  var _vegetarian=false;
  var _vegan=false;
  var _lactoseFree=false;
  @override 
  initState(){
    _glutenFree=widget.currentFilters['gluten'];
    _vegetarian=widget.currentFilters['vegetarian'];
    _lactoseFree=widget.currentFilters['lactose'];
    _vegan=widget.currentFilters['vegan'];
    super.initState();
  }
  Widget _buildSwitchListTile(String title,String description,bool currentValue,Function updateValue,){
    return SwitchListTile(title:Text(title),value:currentValue,subtitle: Text(description),
            onChanged: updateValue,
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(title:Text('Your Filters'),
            actions:<Widget>[
              IconButton(icon:Icon(Icons.save),onPressed: (){
                final selectedFilters={
                   'gluten':_glutenFree,
                   'lactose':_lactoseFree,
                   'vegan':_vegan,
                   'vegetarian':_vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              
              
              ),
            ],
    ),
    drawer:MainDrawer(),
    body:Column(
      children:<Widget>[
        Container(
          padding:EdgeInsets.all(20),
          child:Text('Adjust your meal selection.',style:Theme.of(context).textTheme.title,)
        ),
        Expanded(child:ListView(
          children:<Widget>[
            _buildSwitchListTile('Gluten-free', 'Only include Gluten-free meals', _glutenFree, (newValue){
setState(() {
  _glutenFree=newValue;
});
            },
            ),
             _buildSwitchListTile('Lactose-free', 'Only include Lactose-free meals', _lactoseFree, (newValue){
setState(() {
  _lactoseFree=newValue;
});
            },
            ),
                _buildSwitchListTile('Vegetarian', 'Only include Vegetarian meals', _vegetarian, (newValue){
setState(() {
  _vegetarian=newValue;
});
            },
            ),

                  _buildSwitchListTile('Vegan', 'Only include Vegan meals', _vegan, (newValue){
setState(() {
  _vegan=newValue;
});
            },
            ),
          ],
        ),),
      ],
    ),
    );
  }
}