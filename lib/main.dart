import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme:
            Theme.of(context).colorScheme.copyWith(secondary: Colors.amber),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // this is easier to manage
      initialRoute: "/", // default is '/'
      routes: {
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        '/': (ctx) => CategoriesScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        // if pushed route is not in routes
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        // flutter failed to build the screen
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
