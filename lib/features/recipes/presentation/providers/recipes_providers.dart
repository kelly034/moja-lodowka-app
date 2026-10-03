import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';

import '../../../../core/providers/database_provider.dart';
import '../../data/datasources/recipes_local_data_source.dart';
import '../../data/datasources/recipes_local_data_source_impl.dart';
import '../../data/repositories/recipes_repository_impl.dart';

import '../../domain/entities/recipe.dart';
import '../../domain/repositories/recipes_repository.dart';
import '../../domain/usecases/get_all_recipes_use_case.dart';

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