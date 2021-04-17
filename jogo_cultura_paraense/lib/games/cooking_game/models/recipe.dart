import 'package:jogo_cultura_paraense/games/cooking_game/models/ingredient.dart';

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
  String get twoLinesName => name;
}

abstract class Recipes {
  static PatoNoTucupi get patoNoTucupi => PatoNoTucupi();
  static CasquinhaDeCarangueijo get casquinhaDeCarangueijo =>
      CasquinhaDeCarangueijo();
  static Tacaca get tacaca => Tacaca();
  static Manicoba get manicoba => Manicoba();
  static FilhoteComAcai get filhoteComAcai => FilhoteComAcai();
  static BoloDeMacaxeira get boloDeMacaxeira => BoloDeMacaxeira();
  static CremeDeCupuacu get cremeDeCupuacu => CremeDeCupuacu();
  static Vatapa get vatapa => Vatapa();
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
          RecipeIngredient(Ingredients.carangueijo, quantity: 2),
          RecipeIngredient(Ingredients.leiteDeCoco),
          RecipeIngredient(Ingredients.farofa),
        ]);
  @override
  String get twoLinesName => "Casquinha de\nCarangueijo";
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

class Manicoba extends Recipe {
  Manicoba()
      : super(name: "Maniçoba", ingredients: [
          RecipeIngredient(Ingredients.maniva),
          RecipeIngredient(Ingredients.carnePorco),
          RecipeIngredient(Ingredients.carneBoi),
          RecipeIngredient(Ingredients.arroz),
        ]);
}

class FilhoteComAcai extends Recipe {
  FilhoteComAcai()
      : super(name: "Filhote com Açai", ingredients: [
          RecipeIngredient(Ingredients.filhote),
          RecipeIngredient(Ingredients.arroz),
          RecipeIngredient(Ingredients.acai),
          RecipeIngredient(Ingredients.farinhaTapioca),
        ]);
}

class BoloDeMacaxeira extends Recipe {
  BoloDeMacaxeira()
      : super(name: "Bolo de Macaxeira", ingredients: [
          RecipeIngredient(Ingredients.macaxeira),
          RecipeIngredient(Ingredients.acucar),
          RecipeIngredient(Ingredients.ovos),
          RecipeIngredient(Ingredients.cocoRalado),
        ]);
}

class CremeDeCupuacu extends Recipe {
  CremeDeCupuacu()
      : super(name: "Creme de Cupuaçu", ingredients: [
          RecipeIngredient(Ingredients.cupuacu),
          RecipeIngredient(Ingredients.leiteCondensado),
          RecipeIngredient(Ingredients.cremeLeite),
        ]);
}

class Vatapa extends Recipe {
  Vatapa()
      : super(name: "Vatapá", ingredients: [
          RecipeIngredient(Ingredients.camarao),
          RecipeIngredient(Ingredients.tucupi),
          RecipeIngredient(Ingredients.arroz),
        ]);
}
