import 'package:moja_lodowka_app/features/recipes/domain/entities/recipe.dart';
import 'package:moja_lodowka_app/core/database/app_database.dart';

class RecipeModel extends Recipe {
  RecipeModel({
    required super.id,
    required super.name,
    required super.ingredientNames,
    required super.ingredientValues,
    required super.macroValues,
    required super.diets,
    required super.imageUrl,
    required super.recipeUrl,
  });

  factory RecipeModel.fromDrift(
    RecipeTableData recipeData,
    List<RecipeIngredientsTableData> ingredientsData,
    List<RecipeDietsTableData> dietData,
  ) {
    return RecipeModel(
      id: recipeData.id,
      name: recipeData.name,
      ingredientNames: ingredientsData.map((ing) => ing.name).toList(),
      ingredientValues: ingredientsData.map((ing) => ing.value).toList(),
      macroValues: [
        recipeData.calories,
        recipeData.carbohydrates,
        recipeData.sugars,
        recipeData.protein,
        recipeData.fat,
      ],
      diets: dietData.map((diet) => diet.name).toList(),
      imageUrl: recipeData.imageUrl,
      recipeUrl: recipeData.recipeUrl,
    );
  }
}
