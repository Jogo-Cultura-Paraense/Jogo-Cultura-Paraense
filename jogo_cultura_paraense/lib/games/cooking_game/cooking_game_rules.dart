import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/models/order.dart';
import 'package:jogo_cultura_paraense/games/models/recipe.dart';

class CookingGameRules {
  final List<Order> normalOrders;
  final List<Order> doubleOrders;
  final int time;

  CookingGameRules({
    @required this.normalOrders,
    @required this.doubleOrders,
    @required this.time,
  });

  List<Order> get allOrders {
    final allOrders = <Order>[];
    allOrders.addAll(normalOrders);
    allOrders.addAll(doubleOrders);
    allOrders.shuffle();
    return allOrders;
  }
}

class CookingGameRules1 extends CookingGameRules {
  CookingGameRules1()
      : super(
          normalOrders: <Order>[
            Order.fromRecipe(Recipes.patoNoTucupi),
            Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
            Order.fromRecipe(Recipes.tacaca),
          ],
          doubleOrders: <Order>[
            Order.fromRecipe(Recipes.patoNoTucupi).doubleOrder(),
            Order.fromRecipe(Recipes.casquinhaDeCarangueijo).doubleOrder(),
          ],
          time: (4 * 60 + 30), // 4 minutos e 30 segudos
        );
}
