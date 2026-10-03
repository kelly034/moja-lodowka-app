import 'package:moja_lodowka_app/features/recipes/domain/repositories/recipes_repository.dart';

import '../../domain/entities/recipe.dart';
import '../datasources/recipes_local_data_source.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  final RecipesLocalDataSource localDataSource;
  RecipesRepositoryImpl(this.localDataSource);

  @override
  Future<List<Recipe>> getAllRecipes() async {
    return await localDataSource.getAllRecipes();
  }

  @override
  Future<Recipe?> getRecipeById(int id) async {
    return await localDataSource.getRecipeById(id);
  }
}
