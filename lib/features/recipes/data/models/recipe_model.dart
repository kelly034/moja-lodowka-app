import 'package:moja_lodowka_app/features/recipes/domain/entities/recipe.dart';
import 'package:moja_lodowka_app/core/database/app_database.dart';

class RecipeModel extends Recipe {
  RecipeModel({
    required super.id,
    required super.name,
    required super.ingredientNames,
    required super.ingredientValues,
    required super.macroValues,
    required super.diet,
    required super.imageUrl,
  });

  factory RecipeModel.fromDrift(
      RecipeTableData recipeData,
      List<RecipeIngredientsTableData> ingredientsData,
      ) {
    return RecipeModel(
      id: recipeData.id,
      name: recipeData.name,
      ingredientNames: ingredientsData.map((ing) => ing.name).toList(),
      ingredientValues: ingredientsData.map((ing) => ing.value).toList(),
      macroValues: [
        recipeData.calories,
        recipeData.carbohydrates,
        recipeData.protein,
        recipeData.fat,
      ],
      diet: recipeData.diet,
      imageUrl: recipeData.imageUrl,
    );
  }
}