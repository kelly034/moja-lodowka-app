import '../../domain/entities/recipe.dart';

abstract class RecipesLocalDataSource {
  Future<List<Recipe>> getAllRecipes();
  Future<Recipe?> getRecipeById(int id);
}