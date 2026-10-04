// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fridge_product_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productByName)
final productByNameProvider = ProductByNameFamily._();

final class ProductByNameProvider
    extends
        $FunctionalProvider<
          AsyncValue<FridgeProduct>,
          FridgeProduct,
          FutureOr<FridgeProduct>
        >
    with $FutureModifier<FridgeProduct>, $FutureProvider<FridgeProduct> {
  ProductByNameProvider._({
    required ProductByNameFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productByNameProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productByNameHash();

  @override
  String toString() {
    return r'productByNameProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<FridgeProduct> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FridgeProduct> create(Ref ref) {
    final argument = this.argument as String;
    return productByName(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductByNameProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productByNameHash() => r'c5dce3fd3c3cf0052d134d00350ba9bcf24cdd3f';

final class ProductByNameFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<FridgeProduct>, String> {
  ProductByNameFamily._()
    : super(
        retry: null,
        name: r'productByNameProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductByNameProvider call(String name) =>
      ProductByNameProvider._(argument: name, from: this);

  @override
  String toString() => r'productByNameProvider';
}

@ProviderFor(allProducts)
final allProductsProvider = AllProductsProvider._();

final class AllProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<FridgeProduct>>,
          List<FridgeProduct>,
          Stream<List<FridgeProduct>>
        >
    with
        $FutureModifier<List<FridgeProduct>>,
        $StreamProvider<List<FridgeProduct>> {
  AllProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allProductsHash();

  @$internal
  @override
  $StreamProviderElement<List<FridgeProduct>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<FridgeProduct>> create(Ref ref) {
    return allProducts(ref);
  }
}

String _$allProductsHash() => r'b606f6908304979666e1c6d812cf3b25273836df';
