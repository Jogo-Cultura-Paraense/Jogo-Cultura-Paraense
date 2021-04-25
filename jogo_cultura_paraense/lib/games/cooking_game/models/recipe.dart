import 'package:jogo_cultura_paraense/games/cooking_game/models/ingredient.dart';

class RecipeIngredient extends Ingredient {
  final int quantity;

  RecipeIngredient(
    String id, {
    this.quantity = 1,
    String imagePath,
  }) : super(id, imagePath: imagePath);

  factory RecipeIngredient.fromIngredient(
    Ingredient ingredient, {
    int quantity = 1,
  }) {
    return RecipeIngredient(
      ingredient.id,
      quantity: quantity,
      imagePath: ingredient.imagePath,
    );
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
          RecipeIngredient.fromIngredient(Ingredients.pato),
          RecipeIngredient.fromIngredient(Ingredients.tucupi),
          RecipeIngredient.fromIngredient(Ingredients.jambu),
          RecipeIngredient.fromIngredient(Ingredients.arroz),
        ]);
}

class CasquinhaDeCarangueijo extends Recipe {
  CasquinhaDeCarangueijo()
      : super(name: "Casquinha de Carangueijo", ingredients: [
          RecipeIngredient.fromIngredient(Ingredients.carangueijo, quantity: 2),
          RecipeIngredient.fromIngredient(Ingredients.leiteDeCoco),
          RecipeIngredient.fromIngredient(Ingredients.farofa),
        ]);
  @override
  String get twoLinesName => "Casquinha de\nCarangueijo";
}

class Tacaca extends Recipe {
  Tacaca()
      : super(name: "Tacacá", ingredients: [
          RecipeIngredient.fromIngredient(Ingredients.tucupi),
          RecipeIngredient.fromIngredient(Ingredients.camarao),
          RecipeIngredient.fromIngredient(Ingredients.jambu),
          RecipeIngredient.fromIngredient(Ingredients.gomaDeTapica),
        ]);
}

class Manicoba extends Recipe {
  Manicoba()
      : super(name: "Maniçoba", ingredients: [
          RecipeIngredient.fromIngredient(Ingredients.maniva),
          RecipeIngredient.fromIngredient(Ingredients.carnePorco),
          RecipeIngredient.fromIngredient(Ingredients.carneBoi),
          RecipeIngredient.fromIngredient(Ingredients.arroz),
        ]);
}

class FilhoteComAcai extends Recipe {
  FilhoteComAcai()
      : super(name: "Filhote com Açai", ingredients: [
          RecipeIngredient.fromIngredient(Ingredients.filhote),
          RecipeIngredient.fromIngredient(Ingredients.arroz),
          RecipeIngredient.fromIngredient(Ingredients.acai),
          RecipeIngredient.fromIngredient(Ingredients.farinhaTapioca),
        ]);
}

class BoloDeMacaxeira extends Recipe {
  BoloDeMacaxeira()
      : super(name: "Bolo de Macaxeira", ingredients: [
          RecipeIngredient.fromIngredient(Ingredients.macaxeira),
          RecipeIngredient.fromIngredient(Ingredients.acucar),
          RecipeIngredient.fromIngredient(Ingredients.ovos),
          RecipeIngredient.fromIngredient(Ingredients.cocoRalado),
        ]);
}

class CremeDeCupuacu extends Recipe {
  CremeDeCupuacu()
      : super(name: "Creme de Cupuaçu", ingredients: [
          RecipeIngredient.fromIngredient(Ingredients.cupuacu),
          RecipeIngredient.fromIngredient(Ingredients.leiteCondensado),
          RecipeIngredient.fromIngredient(Ingredients.cremeLeite),
        ]);
}

class Vatapa extends Recipe {
  Vatapa()
      : super(name: "Vatapá", ingredients: [
          RecipeIngredient.fromIngredient(Ingredients.camarao),
          RecipeIngredient.fromIngredient(Ingredients.tucupi),
          RecipeIngredient.fromIngredient(Ingredients.arroz),
        ]);
}
