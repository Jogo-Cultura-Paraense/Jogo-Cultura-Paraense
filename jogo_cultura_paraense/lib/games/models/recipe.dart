import 'package:jogo_cultura_paraense/games/models/ingredient.dart';

class RecipeIngredient {
  final int quantity;
  final Ingredient ingredient;

  const RecipeIngredient(this.ingredient, {this.quantity = 1});

  RecipeIngredient doubleQuantity() {
    return RecipeIngredient(this.ingredient, quantity: 2 * this.quantity);
  }
}

class Recipe {
  final String name;
  final List<RecipeIngredient> _ingredients;

  const Recipe({List<RecipeIngredient> ingredients, this.name})
      : _ingredients = ingredients;

  List<RecipeIngredient> get ingredients => _ingredients;

  Recipe doubleRecipe() {
    final List<RecipeIngredient> newIngredients = [];
    for (RecipeIngredient ingredient in this._ingredients) {
      newIngredients.add(ingredient.doubleQuantity());
    }
    return Recipe(name: this.name, ingredients: newIngredients);
  }
}

abstract class Recipes {
  static PatoNoTucupi get patoNoTucupi => PatoNoTucupi();
  static CasquinhaDeCarangueijo get casquinhaDeCarangueijo =>
      CasquinhaDeCarangueijo();
  static Tacaca get tacaca => Tacaca();
}

class PatoNoTucupi extends Recipe {
  PatoNoTucupi()
      : super(name: "Pato no Tucupi", ingredients: [
          RecipeIngredient(Ingredients.pato),
          RecipeIngredient(Ingredients.tucupi),
          RecipeIngredient(Ingredients.jambu),
          RecipeIngredient(Ingredients.arroz),
        ]);
}

class CasquinhaDeCarangueijo extends Recipe {
  CasquinhaDeCarangueijo()
      : super(name: "Casquinha de Carangueijo", ingredients: [
          RecipeIngredient(Ingredients.carangueijo),
          RecipeIngredient(Ingredients.leiteDeCoco),
          RecipeIngredient(Ingredients.farofa),
        ]);
}

class Tacaca extends Recipe {
  Tacaca()
      : super(name: "Tacacá", ingredients: [
          RecipeIngredient(Ingredients.tucupi),
          RecipeIngredient(Ingredients.camarao),
          RecipeIngredient(Ingredients.jambu),
          RecipeIngredient(Ingredients.gomaDeTapica),
        ]);
}
