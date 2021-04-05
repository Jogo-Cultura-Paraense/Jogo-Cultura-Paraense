import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/models/recipe.dart';

class OrderCard extends StatelessWidget {
  final double height;
  final double width;
  final Recipe recipe;

  const OrderCard({
    @required this.recipe,
    @required this.height,
    @required this.width,
    Key key,
  }) : super(key: key);

  List<Widget> _buildGridList() {
    final gridList = <Widget>[];
    for (RecipeIngredient ingredient in recipe.ingredients) {
      gridList.addAll([
        Container(
          // margin: EdgeInsets.only(left: 5.0),
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
      padding: EdgeInsets.all(5.0),
      height: height,
      width: width,
      color: Colors.yellow,
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(recipe.name),
          ),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.all(5.0),
              crossAxisCount: 4,
              children: _buildGridList(),
            ),
          ),
        ],
      ),
    );
  }
}
