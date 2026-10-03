class Recipe {
  final int id;
  final String name;
  final List<String> ingredientNames;
  final List<double> ingredientValues;
  final List<String> macroValues;
  final List<String> diets;
  final String imageUrl;
  final String recipeUrl;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredientNames,
    required this.ingredientValues,
    required this.macroValues,
    required this.diets,
    required this.imageUrl,
    required this.recipeUrl,
  });
}
