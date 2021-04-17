import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/order.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/models/recipe.dart';

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
            Order.fromRecipe(Recipes.casquinhaDeCarangueijo),
          ],
          doubleOrders: <Order>[
            Order.fromRecipe(Recipes.patoNoTucupi).doubleOrder(),
          ],
          time: (4 * 60 + 30), // 4 minutos e 30 segudos
        );
}

class CookingGameRules2 extends CookingGameRules {
  CookingGameRules2()
      : super(
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
}

class CookingGameRules3 extends CookingGameRules {
  CookingGameRules3()
      : super(
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
}

class CookingGameRules4 extends CookingGameRules {
  CookingGameRules4()
      : super(
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
}

class CookingGameRules5 extends CookingGameRules {
  CookingGameRules5()
      : super(
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
}

class CookingGameRules6 extends CookingGameRules {
  CookingGameRules6()
      : super(
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
