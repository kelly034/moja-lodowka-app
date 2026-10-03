// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipes)
final recipesProvider = RecipesProvider._();

final class RecipesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Recipe>>,
          List<Recipe>,
          FutureOr<List<Recipe>>
        >
    with $FutureModifier<List<Recipe>>, $FutureProvider<List<Recipe>> {
  RecipesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipesHash();

  @$internal
  @override
  $FutureProviderElement<List<Recipe>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Recipe>> create(Ref ref) {
    return recipes(ref);
  }
}

String _$recipesHash() => r'1baee69323c1b07537596487f537b0a9a7fd5832';

@ProviderFor(recipeById)
final recipeByIdProvider = RecipeByIdFamily._();

final class RecipeByIdProvider
    extends $FunctionalProvider<AsyncValue<Recipe?>, Recipe?, FutureOr<Recipe?>>
    with $FutureModifier<Recipe?>, $FutureProvider<Recipe?> {
  RecipeByIdProvider._({
    required RecipeByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'recipeByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeByIdHash();

  @override
  String toString() {
    return r'recipeByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Recipe?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Recipe?> create(Ref ref) {
    final argument = this.argument as int;
    return recipeById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeByIdHash() => r'cc58ce00a7f4699cdebf257d56e273e3cb70b619';

final class RecipeByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Recipe?>, int> {
  RecipeByIdFamily._()
    : super(
        retry: null,
        name: r'recipeByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecipeByIdProvider call(int id) =>
      RecipeByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'recipeByIdProvider';
}
