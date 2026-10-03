import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/database_provider.dart';
import '../../data/datasources/fridge_product_data_source.dart';
import '../../data/datasources/fridge_product_data_source_impl.dart';
import '../../data/repositories/fridge_product_repository_impl.dart';
import '../../domain/repositories/fridge_product_repository.dart';
import '../../domain/usecases/get_all_products_use_case.dart';

final fridgeProductLocalDataSourceProvider = Provider<FridgeProductDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return FridgeProductDataSourceImpl(database);
});

final fridgeProductRepositoryProvider = Provider<FridgeProductRepository>((ref) {
  final localDataSource = ref.watch(fridgeProductLocalDataSourceProvider);
  return FridgeProductRepositoryImpl(localDataSource);
});

final getAllProductsUseCaseProvider = Provider<GetAllProductsUseCase>((ref) {
  final repository = ref.watch(fridgeProductRepositoryProvider);
  return GetAllProductsUseCase(repository);
});
