import 'package:jogo_cultura_paraense/games/models/ingredient.dart';
import 'package:jogo_cultura_paraense/games/models/recipe.dart';

class OrderIngredient {
  int _quantity;
  final Ingredient ingredient;

  OrderIngredient(this.ingredient, {int quantity = 1}) : _quantity = quantity;

  factory OrderIngredient.fromRecipeIngredient(RecipeIngredient ingredient) {
    return OrderIngredient(
      ingredient.ingredient,
      quantity: ingredient.quantity,
    );
  }

  int get quantity => _quantity;

  void removeQuantity() {
    _quantity -= 1;
  }

  OrderIngredient doubleQuantity() {
    return OrderIngredient(this.ingredient, quantity: 2 * this.quantity);
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
    for (int i = 0; i < _ingredients.length; i += 1) {
      if (_ingredients[i].ingredient.id == ingredientId) {
        _ingredients[i].removeQuantity();
        if (_ingredients[i].quantity < 1) {
          _ingredients.removeAt(i);
        }
        break;
      }
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
