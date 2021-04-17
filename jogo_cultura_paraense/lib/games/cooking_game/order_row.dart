import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
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
    return BlocBuilder<CookingGameBloc, CookingGameState>(
      builder: (context, state) {
        return Container(
          height: height,
          width: width,
          color: Colors.transparent,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.orders.length,
            itemBuilder: (context, index) {
              return OrderCard(
                order: state.orders[index],
                currentOrder: index == 0,
                height: height,
                width: width / 3,
              );
            },
          ),
        );
      },
    );
  }
}
