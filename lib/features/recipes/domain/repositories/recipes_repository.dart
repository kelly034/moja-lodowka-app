import '../entities/recipe.dart';

abstract class RecipesRepository {
  Future<List<Recipe>> getAllRecipes();
}