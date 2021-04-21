import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/order.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/recipe.dart';

class CookingGameRules {
  final int level;
  final int time;
  final List<Order> normalOrders;
  final List<Order> doubleOrders;

  CookingGameRules({
    @required this.level,
    @required this.time,
    @required this.normalOrders,
    @required this.doubleOrders,
  });

  List<Order> get allOrders {
    final allOrders = <Order>[];
    allOrders.addAll(normalOrders);
    allOrders.addAll(doubleOrders);
    allOrders.shuffle();
    return allOrders;
  }
}

abstract class CookingGameRulebook {
  static CookingGameRules get level1 => CookingGameRules(
        level: 1,
        normalOrders: <Order>[
          Order.fromRecipe(Recipes.patoNoTucupi),
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
          Order.fromRecipe(Recipes.tacaca),
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
        ],
        doubleOrders: <Order>[
          Order.fromRecipe(Recipes.patoNoTucupi).doubleOrder(),
        ],
        time: (4 * 60 + 30), // 4 minutos e 30 segudos
      );

  static CookingGameRules get level2 => CookingGameRules(
        level: 2,
        normalOrders: <Order>[
          Order.fromRecipe(Recipes.patoNoTucupi),
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
          Order.fromRecipe(Recipes.tacaca),
          Order.fromRecipe(Recipes.manicoba),
          Order.fromRecipe(Recipes.patoNoTucupi),
        ],
        doubleOrders: <Order>[
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo).doubleOrder(),
        ],
        time: (4 * 60), // 4 minutos
      );

  static CookingGameRules get level3 => CookingGameRules(
        level: 3,
        normalOrders: <Order>[
          Order.fromRecipe(Recipes.patoNoTucupi),
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
          Order.fromRecipe(Recipes.tacaca),
          Order.fromRecipe(Recipes.manicoba),
          Order.fromRecipe(Recipes.filhoteComAcai),
          Order.fromRecipe(Recipes.tacaca),
        ],
        doubleOrders: <Order>[
          Order.fromRecipe(Recipes.manicoba).doubleOrder(),
        ],
        time: (3 * 60 + 30), // 3 minutos e 30 segudos
      );

  static CookingGameRules get level4 => CookingGameRules(
        level: 4,
        normalOrders: <Order>[
          Order.fromRecipe(Recipes.patoNoTucupi),
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
          Order.fromRecipe(Recipes.tacaca),
          Order.fromRecipe(Recipes.manicoba),
          Order.fromRecipe(Recipes.filhoteComAcai),
          Order.fromRecipe(Recipes.boloDeMacaxeira),
          Order.fromRecipe(Recipes.manicoba),
        ],
        doubleOrders: <Order>[
          Order.fromRecipe(Recipes.tacaca).doubleOrder(),
        ],
        time: (3 * 60), // 3 minutos
      );

  static CookingGameRules get level5 => CookingGameRules(
        level: 5,
        normalOrders: <Order>[
          Order.fromRecipe(Recipes.patoNoTucupi),
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
          Order.fromRecipe(Recipes.tacaca),
          Order.fromRecipe(Recipes.manicoba),
          Order.fromRecipe(Recipes.filhoteComAcai),
          Order.fromRecipe(Recipes.boloDeMacaxeira),
          Order.fromRecipe(Recipes.cremeDeCupuacu),
          Order.fromRecipe(Recipes.filhoteComAcai),
        ],
        doubleOrders: <Order>[
          Order.fromRecipe(Recipes.boloDeMacaxeira).doubleOrder(),
        ],
        time: (2 * 60 + 30), // 2 minutos e 30 segudos
      );

  static CookingGameRules get level6 => CookingGameRules(
        level: 6,
        normalOrders: <Order>[
          Order.fromRecipe(Recipes.patoNoTucupi),
          Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
          Order.fromRecipe(Recipes.tacaca),
          Order.fromRecipe(Recipes.manicoba),
          Order.fromRecipe(Recipes.filhoteComAcai),
          Order.fromRecipe(Recipes.boloDeMacaxeira),
          Order.fromRecipe(Recipes.cremeDeCupuacu),
          Order.fromRecipe(Recipes.vatapa),
          Order.fromRecipe(Recipes.boloDeMacaxeira),
        ],
        doubleOrders: <Order>[
          Order.fromRecipe(Recipes.filhoteComAcai).doubleOrder(),
        ],
        time: (2 * 60), // 2 minutos
      );
}
