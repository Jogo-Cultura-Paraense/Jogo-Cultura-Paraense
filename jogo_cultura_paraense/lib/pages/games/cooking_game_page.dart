import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/cooking_game_rules.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/order.dart';

class CookingGamePage extends StatelessWidget {
  static const String routeName = '/cooking_game';
  final List<Order> _orders;
  final int time;

  const CookingGamePage({
    @required List<Order> orders,
    @required this.time,
    Key key,
  })  : _orders = orders,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CookingGameBloc(_orders, time),
      child: CookingGame(time),
    );
  }
}

class CookingGamePageArgs {
  final List<Order> _orders;
  final int time;

  List<Order> get orders => _orders;

  const CookingGamePageArgs(this.time, List<Order> orders) : _orders = orders;

  factory CookingGamePageArgs.fromRules(CookingGameRules rules) {
    return CookingGamePageArgs(rules.time, rules.allOrders);
  }
}
