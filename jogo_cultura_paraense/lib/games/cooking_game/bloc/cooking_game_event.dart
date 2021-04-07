part of 'cooking_game_bloc.dart';

@immutable
abstract class CookingGameEvent {}

class RemoveIngredient extends CookingGameEvent {
  final String ingredientId;

  RemoveIngredient(this.ingredientId);
}
