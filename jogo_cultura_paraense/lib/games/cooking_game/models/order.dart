import 'package:jogo_cultura_paraense/games/cooking_game/models/recipe.dart';

class OrderIngredient extends RecipeIngredient {
  int _currentQuantity;

  OrderIngredient(String id, {int quantity = 1, String imagePath})
      : _currentQuantity = quantity,
        super(
          id,
          imagePath: imagePath,
          quantity: quantity,
        );

  factory OrderIngredient.fromRecipeIngredient(RecipeIngredient ingredient) {
    return OrderIngredient(
      ingredient.id,
      quantity: ingredient.quantity,
      imagePath: ingredient.imagePath,
    );
  }

  int get currentQuantity => _currentQuantity;

  void removeQuantity() {
    _currentQuantity -= 1;
  }

  OrderIngredient doubleQuantity() {
    return OrderIngredient(
      this.id,
      quantity: 2 * this.quantity,
      imagePath: this.imagePath,
    );
  }
}

class Order {
  final String name;
  final List<OrderIngredient> _ingredients;

  const Order({List<OrderIngredient> ingredients, this.name})
      : _ingredients = ingredients;

  List<OrderIngredient> get ingredients => _ingredients;

  factory Order.fromRecipe(Recipe recipe) {
    final orderIngredients = <OrderIngredient>[];
    for (RecipeIngredient ingredient in recipe.ingredients) {
      orderIngredients.add(OrderIngredient.fromRecipeIngredient(ingredient));
    }
    return Order(name: recipe.twoLinesName, ingredients: orderIngredients);
  }

  void removeIngredient(String ingredientId) {
    bool found = false;
    for (int i = 0; i < _ingredients.length; i += 1) {
      if (_ingredients[i].id == ingredientId) {
        found = true;
        _ingredients[i].removeQuantity();
        if (_ingredients[i].currentQuantity < 1) {
          _ingredients.removeAt(i);
        }
        break;
      }
    }
    if (!found) {
      throw Exception("Ingredient with id '$ingredientId' not found");
    }
  }

  Order doubleOrder() {
    final List<OrderIngredient> newIngredients = [];
    for (OrderIngredient ingredient in this._ingredients) {
      newIngredients.add(ingredient.doubleQuantity());
    }
    return Order(name: this.name, ingredients: newIngredients);
  }
}
