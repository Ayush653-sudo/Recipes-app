import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  CategoryItem(this.id,this.title,this.color);
void selectCategory(BuildContext ctx){
 // Navigator.of(ctx).push(MaterialPageRoute(builder: (_){  //it will directly route to categorymealscreen from this pages
   // return CategoryMealScreen(id,title);//now look at below to navigate from main file
   Navigator.of(ctx).pushNamed('/category-meals',arguments: {'id':id,'title':title,});
 // },),);
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,//color color wave appear on Tapping
      borderRadius: BorderRadius.circular(15),//it should have same radius as that of container 
      
      child:Container(
      padding: const EdgeInsets.all(15),
      // ignore: deprecated_member_use
      child: Text(title,style:Theme.of(context).textTheme.title),
      decoration: BoxDecoration(gradient:LinearGradient(colors:[color.withOpacity(0.7),color,],
      begin:Alignment.topLeft,
      end:Alignment.bottomRight,
      ),
      borderRadius:BorderRadius.circular(15),//we cant use const in this 
      ),
      
    ),);
  }
}