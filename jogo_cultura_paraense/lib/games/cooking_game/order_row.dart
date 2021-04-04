import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/order_card.dart';

class OrderRow extends StatelessWidget {
  final double height;
  final double width;

  const OrderRow({
    @required this.height,
    @required this.width,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return OrderCard(height: height, width: width / 2);
        },
      ),
    );
  }
}
