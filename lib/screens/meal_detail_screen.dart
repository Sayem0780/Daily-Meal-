import 'package:daliemeals/widgets/articlepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/dynamic_Text.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorite,this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meals) => meals.id == mealId);
    final String a = "Hello Hunny";
    Widget buildTitle(BuildContext context,child){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(10),
        //width: double.infinity,
        child: Text(child,
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),)
      );
    }
    Widget buildBody(BuildContext context,child){
      return Container(
        height: 200,
        width: 330,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
    }
    return Scaffold(
      appBar: AppBar(title: Text('${selectedmeal.title}'),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                height: 250,
                width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10)
              ),
             padding: EdgeInsets.symmetric(vertical: 10),
                child: Image.network(selectedmeal.imageUrl)
            ),
            buildTitle(context, 'Ingradients'),
            Container(
              height: 200,
              width: 330,
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                  itemBuilder: (context,index)=> Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Card(
                      elevation: 8,
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText(selectedmeal.ingredients[index]),
                      ),
                    ),
                  ),
              itemCount: selectedmeal.ingredients.length,),
            ),
            buildTitle(context, 'Steps'),
            buildBody(context, ListView.builder(
                itemBuilder: (ctx,index)=>ListTile(
                  leading: CircleAvatar(
                      child: Text('# ${index+1}',)),
                  title: SelectableText(selectedmeal.steps[index],onSelectionChanged:(selection,c){},
                    onTap: (){showDialog(context: context, builder:(context){return ArticlePage(selectedmeal.steps[index],"the");});},
                  ),
                ),
            itemCount: selectedmeal.steps.length,)),
            buildTitle(context, 'Have A Nice Meal!'),
            SizedBox(height: 20,),
            SizedBox(height: 10,),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }


}


//floatingActionButton: FloatingActionButton(
//         child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border,),
//         onPressed:(){
//           Navigator.of(context).pop(toggleFavorite(mealId));
//         } ,
//       ),
