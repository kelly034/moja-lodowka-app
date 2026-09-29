class Recipe {
  final int id;
  final String name;
  final List<String> ingredientNames;
  final List<int> ingredientValues;
  final List<int> macroValues;
  final String diet;
  final String imageUrl;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredientNames,
    required this.ingredientValues,
    required this.macroValues,
    required this.diet,
    required this.imageUrl
  });
}