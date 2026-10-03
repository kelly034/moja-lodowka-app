import '../entities/recipe.dart';

abstract class RecipesRepository {
  Future<List<Recipe>> getAllRecipes();
  Future<Recipe?> getRecipeById(int id);
}