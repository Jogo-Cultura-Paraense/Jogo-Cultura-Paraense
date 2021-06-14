import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/order.dart';

class OrderCard extends StatelessWidget {
  final double height;
  final double width;
  final Order order;
  final bool currentOrder;

  const OrderCard({
    @required this.order,
    @required this.height,
    @required this.width,
    this.currentOrder = false,
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
              "${ingredient.currentQuantity}x",
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/${ingredient.imagePath}'),
            ),
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
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: currentOrder ? Border.all(width: 1, color: Colors.red) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Flexible(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(order.name),
            ),
            fit: FlexFit.tight,
            flex: 2,
          ),
          Flexible(
            child: GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.all(5.0),
              crossAxisCount: 4,
              children: _buildGridList(),
            ),
            fit: FlexFit.tight,
            flex: 4,
          ),
        ],
      ),
    );
  }
}
