import "../repositories/recipes_repository.dart";
import "../entities/recipe.dart";

class GetAllRecipesUseCase {
  final RecipesRepository repository;
  GetAllRecipesUseCase(this.repository);

  Future<List<Recipe>> call() => repository.getAllRecipes();
}
