class Recipe {
  final int id;
  final String name;
  final List<String> ingredientNames;
  final List<int> macroValues;
  final String diet;
  final String imageUrl;
  final String recipeUrl;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredientNames,
    required this.macroValues,
    required this.diet,
    required this.imageUrl,
    required this.recipeUrl,
  });
}