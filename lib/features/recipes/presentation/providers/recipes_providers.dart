import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";

import '../../../../core/database/app_database.dart';

import '../../../../core/providers/database_provider.dart';
import '../../../fridge/domain/entities/fridge_product.dart';
import '../../../fridge/presentation/providers/fridge_product_providers.dart';
import '../../data/datasources/recipes_local_data_source.dart';
import '../../data/datasources/recipes_local_data_source_impl.dart';
import '../../data/repositories/recipes_repository_impl.dart';

import '../../domain/entities/recipe.dart';
import '../../domain/repositories/recipes_repository.dart';
import '../../domain/usecases/get_all_recipes_use_case.dart';
import '../../domain/usecases/get_recipe_by_id_use_case.dart';

part "recipes_providers.g.dart";

final recipesLocalDataSourceProvider = Provider<RecipesLocalDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return RecipesLocalDataSourceImpl(database);
});

final recipesRepositoryProvider = Provider<RecipesRepository>((ref) {
  final localDataSource = ref.watch(recipesLocalDataSourceProvider);
  return RecipesRepositoryImpl(localDataSource);
});

final getRecipesUseCaseProvider = Provider<GetAllRecipesUseCase>((ref) {
  final repository = ref.watch(recipesRepositoryProvider);
  return GetAllRecipesUseCase(repository);
});

final getRecipeByIdUseCaseProvider = Provider<GetRecipeByIdUseCase>((ref) {
  final repository = ref.watch(recipesRepositoryProvider);
  return GetRecipeByIdUseCase(repository);
});

@riverpod
Future<List<Recipe>> recipes(Ref ref) async {
  return await ref.read(getRecipesUseCaseProvider).call();
}

@riverpod
Future<Recipe?> recipeById(Ref ref, int id) async {
  final getRecipeByIdUseCase = ref.watch(getRecipeByIdUseCaseProvider);
  return await getRecipeByIdUseCase.call(id);
}

@riverpod
Future<List<FridgeProduct>> recipeProducts(Ref ref, int id) {
  final getRecipeProductsUseCase = ref.watch(getRecipeProductsUseCaseProvider);
  return getRecipeProductsUseCase.call(id);
}