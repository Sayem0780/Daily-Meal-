import 'package:daliemeals/models/meal.dart';
import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';
class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;
  TabsScreen(this.favouriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,dynamic>> _pages=[];
  @override
  void initState(){
     _pages =[
      {'page': CategoriesScreen(),
        'title': 'Categories'
      },

      {
        'page': FavoritesScreen(widget.favouriteMeal),
        'title': 'Your Favourites'
      }

    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {

      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
    body: _pages[_selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
          label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
          label: 'Favourites'
          ),

        ],
      ),
    );
  }
}
//if you want to set the Tabs top of the page or in the appBar Then follow this
/* DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(title: Text('Meals'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            )
          ],

          ),),
          body: TabBarView(
            children: <Widget>[
              CategoriesScreen(),
              FavoritesScreen(),
            ],
          ),
        ) )*/
