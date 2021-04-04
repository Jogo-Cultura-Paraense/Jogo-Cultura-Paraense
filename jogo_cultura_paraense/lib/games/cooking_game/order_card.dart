import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/models/recipe.dart';

class OrderCard extends StatelessWidget {
  final double height;
  final double width;

  const OrderCard({@required this.height, @required this.width, Key key})
      : super(key: key);

  List<Widget> _buildGridList(Recipe recipe) {
    final gridList = <Widget>[];
    for (RecipeIngredient ingredient in recipe.ingredients) {
      gridList.addAll([
        Container(
          margin: EdgeInsets.only(left: 8.0),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text("${ingredient.quantity}x"),
          ),
        ),
        Container(
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(ingredient.ingredient.imagePath),
          ),
        ),
      ]);
    }
    return gridList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: height,
      width: width,
      color: Colors.yellow,
      child: GridView.count(
        padding: EdgeInsets.all(5.0),
        crossAxisCount: 4,
        children: _buildGridList(Recipes.patoNoTucupi),
      ),
    );
  }
}
