import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/order.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/recipe.dart';
import 'package:jogo_cultura_paraense/model/map.dart';

class CookingGameRules {
  final String levelName;
  final int level;
  final int time;
  final int hints;
  final List<Order> normalOrders;
  final List<Order> doubleOrders;
  final List<String> newItems;

  CookingGameRules({
    @required this.level,
    @required this.time,
    @required this.normalOrders,
    @required this.doubleOrders,
    @required this.newItems,
    String levelName,
    int hints,
  })  : this.hints = hints ?? level,
        this.levelName = levelName ?? level.toString();

  List<Order> get allOrders {
    final allOrders = <Order>[];
    allOrders.addAll(List.from(normalOrders));
    allOrders.addAll(List.from(doubleOrders));
    allOrders.shuffle();
    return allOrders;
  }
}

abstract class CookingGameRulebook {
  static CookingGameRules get level1 => CookingGameRules(
        level: 1,
        levelName: Maps.sudoeste.region,
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
        newItems: ['id_pato_tucupi', 'id_casquinha_caranguejo', 'id_tacaca'],
      );

  static CookingGameRules get level2 => CookingGameRules(
        level: 2,
        levelName: Maps.baixoAmazonas.region,
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
        newItems: ['id_manicoba'],
      );

  static CookingGameRules get level3 => CookingGameRules(
        level: 3,
        levelName: Maps.sudeste.region,
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
        newItems: ['id_filhote_acai'],
      );

  static CookingGameRules get level4 => CookingGameRules(
        level: 4,
        levelName: Maps.nordeste.region,
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
        newItems: ['id_bolo_macaxeira'],
      );

  static CookingGameRules get level5 => CookingGameRules(
        level: 5,
        levelName: Maps.marajo.region,
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
        newItems: ['id_creme_cupuacu'],
      );

  static CookingGameRules get level6 => CookingGameRules(
        level: 6,
        levelName: Maps.metropolitana.region,
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
        newItems: ['id_vatapa'],
      );

  static List<CookingGameRules> get all => [
        CookingGameRulebook.level1,
        CookingGameRulebook.level2,
        CookingGameRulebook.level3,
        CookingGameRulebook.level4,
        CookingGameRulebook.level5,
        CookingGameRulebook.level6,
      ];
}
