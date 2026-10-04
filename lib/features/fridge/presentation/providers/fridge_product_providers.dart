import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moja_lodowka_app/features/fridge/domain/usecases/get_recipe_products_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/database_provider.dart';
import '../../../recipes/domain/entities/recipe.dart';
import '../../../recipes/presentation/providers/recipes_providers.dart';
import '../../data/datasources/fridge_product_data_source.dart';
import '../../data/datasources/fridge_product_data_source_impl.dart';
import '../../data/repositories/fridge_product_repository_impl.dart';
import '../../domain/entities/fridge_product.dart';
import '../../domain/repositories/fridge_product_repository.dart';
import '../../domain/usecases/add_product_use_case.dart';
import '../../domain/usecases/get_all_products_use_case.dart';
import '../../domain/usecases/get_product_by_name_use_case.dart';
import '../../domain/usecases/make_meal_use_case.dart';

part "fridge_product_providers.g.dart";

final fridgeProductLocalDataSourceProvider = Provider<FridgeProductDataSource>((
  ref,
) {
  final database = ref.watch(databaseProvider);
  return FridgeProductDataSourceImpl(database);
});

final fridgeProductRepositoryProvider = Provider<FridgeProductRepository>((
  ref,
) {
  final localDataSource = ref.watch(fridgeProductLocalDataSourceProvider);
  return FridgeProductRepositoryImpl(localDataSource);
});

final getAllProductsUseCaseProvider = Provider<GetAllProductsUseCase>((ref) {
  final repository = ref.watch(fridgeProductRepositoryProvider);
  return GetAllProductsUseCase(repository);
});

final addProductUseCaseProvider = Provider<AddProductUseCase>((ref) {
  final repository = ref.watch(fridgeProductRepositoryProvider);
  return AddProductUseCase(repository);
});

final makeMealUseCaseProvider = Provider<MakeMealUseCase>((ref) {
  final repository = ref.watch(fridgeProductRepositoryProvider);
  return MakeMealUseCase(repository);
});

final getProductByNameUseCaseProvider = Provider<GetProductByNameUseCase>((ref) {
  final repository = ref.watch(fridgeProductRepositoryProvider);
  return GetProductByNameUseCase(repository);
});

final getRecipeProductsUseCaseProvider = Provider<GetRecipeProductsUseCase>((ref) {
  final fridgeRepository = ref.watch(fridgeProductRepositoryProvider);
  final recipesRepository = ref.watch(recipesRepositoryProvider);
  return GetRecipeProductsUseCase(fridgeRepository, recipesRepository);
});

@riverpod
Future<FridgeProduct> productByName(Ref ref, String name) {
  final getProductByNameUseCase = ref.watch(getProductByNameUseCaseProvider);
  return getProductByNameUseCase.call(name);
}
