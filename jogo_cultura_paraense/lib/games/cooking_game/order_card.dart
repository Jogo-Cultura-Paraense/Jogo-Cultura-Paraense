import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/models/order.dart';

class OrderCard extends StatelessWidget {
  final double height;
  final double width;
  final Order order;

  const OrderCard({
    @required this.order,
    @required this.height,
    @required this.width,
    Key key,
  }) : super(key: key);

  List<Widget> _buildGridList() {
    final gridList = <Widget>[];
    for (OrderIngredient ingredient in order.ingredients) {
      gridList.addAll([
        Container(
          margin: EdgeInsets.only(bottom: 5.0),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              "${ingredient.quantity}x",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5.0),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(),
          ),
          color: Color(int.parse(ingredient.ingredient.imagePath)),
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
            child: Text(order.name),
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
