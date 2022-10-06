import 'package:daliemeals/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'category_meals_screen.dart';

class FiltersScren extends StatefulWidget {
  static const routeName = '/filters';
  late final Function saveFilter;
  final Map<String,dynamic> currentFilters;
  FiltersScren(this.currentFilters,this.saveFilter);

  @override
  State<FiltersScren> createState() => _FiltersScrenState();
}

class _FiltersScrenState extends State<FiltersScren> {
  dynamic _glutenFree = true;
  dynamic _vegetarinFree = false;
  dynamic _vegan = false;
  dynamic _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactos'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarinFree = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(onPressed: ()
          { final selectedFilters = {
          'gluten': _glutenFree,
          'lactos': _lactoseFree,
          'vegan': _vegan,
          'vegetarian': _vegetarinFree,};

          widget.saveFilter(selectedFilters);
          Navigator.of(context).pushNamed('/');
            }, icon: Icon(Icons.save)),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            //height: 200,
            //width: double.infinity,
            //color: Colors.amber,
            margin: EdgeInsets.symmetric(vertical: 20),
            //padding: EdgeInsets.symmetric(vertical: 20,),
            alignment: Alignment.topCenter,
            child: Text('Adjust Your meal sectoin',style: TextStyle(
    fontSize: 30,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.bold,
    ),
          ),
    ),
          Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: <Widget>[

                  SwitchListTile(
                    title: Text('Gluten-Free',style: Theme.of(context).textTheme.headline6,),
                      subtitle: Text('Only Include Glutten Free Meals',style: Theme.of(context).textTheme.headline5,),
                      value: _glutenFree,
                      onChanged: (newvalue){
                      setState(() {
                        _glutenFree = newvalue;
                      });
                  }),
                  SwitchListTile(
                      title: Text('Lactos-Free',style: Theme.of(context).textTheme.headline6,),
                      subtitle: Text('Only Include Lactos Free Meals',style: Theme.of(context).textTheme.headline5,),
                      value: _lactoseFree,
                      onChanged: (newvalue){
                        setState(() {
                          _lactoseFree = newvalue;
                        });
                      }),
                  SwitchListTile(
                      title: Text('Vegetarian',style: Theme.of(context).textTheme.headline6,),
                      subtitle: Text('Only Include Vegetarian Meals',style: Theme.of(context).textTheme.headline5,),
                      value: _vegetarinFree,
                      onChanged: (newvalue){
                        setState(() {
                          _vegetarinFree = newvalue;
                        });
                      }),
                  SwitchListTile(
                      title: Text('Vegan',style: Theme.of(context).textTheme.headline6,),
                      subtitle: Text('Only Include Vegan Meals',style: Theme.of(context).textTheme.headline5,),
                      value: _vegan,
                      onChanged: (newvalue){
                        setState(() {
                          _vegan = newvalue;
                        });
                      }),
                ],
              )
          )
        ],
      ),
    );
  }
}
