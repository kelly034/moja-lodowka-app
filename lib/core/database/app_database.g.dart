// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RecipeTableTable extends RecipeTable
    with TableInfo<$RecipeTableTable, RecipeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dietMeta = const VerificationMeta('diet');
  @override
  late final GeneratedColumn<String> diet = GeneratedColumn<String>(
    'diet',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<int> calories = GeneratedColumn<int>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carbohydratesMeta = const VerificationMeta(
    'carbohydrates',
  );
  @override
  late final GeneratedColumn<int> carbohydrates = GeneratedColumn<int>(
    'carbohydrates',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sugarsMeta = const VerificationMeta('sugars');
  @override
  late final GeneratedColumn<int> sugars = GeneratedColumn<int>(
    'sugars',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<int> protein = GeneratedColumn<int>(
    'protein',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<int> fat = GeneratedColumn<int>(
    'fat',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipeUrlMeta = const VerificationMeta(
    'recipeUrl',
  );
  @override
  late final GeneratedColumn<String> recipeUrl = GeneratedColumn<String>(
    'recipe_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    diet,
    imageUrl,
    calories,
    carbohydrates,
    sugars,
    protein,
    fat,
    recipeUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('diet')) {
      context.handle(
        _dietMeta,
        diet.isAcceptableOrUnknown(data['diet']!, _dietMeta),
      );
    } else if (isInserting) {
      context.missing(_dietMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('carbohydrates')) {
      context.handle(
        _carbohydratesMeta,
        carbohydrates.isAcceptableOrUnknown(
          data['carbohydrates']!,
          _carbohydratesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_carbohydratesMeta);
    }
    if (data.containsKey('sugars')) {
      context.handle(
        _sugarsMeta,
        sugars.isAcceptableOrUnknown(data['sugars']!, _sugarsMeta),
      );
    } else if (isInserting) {
      context.missing(_sugarsMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    } else if (isInserting) {
      context.missing(_fatMeta);
    }
    if (data.containsKey('recipe_url')) {
      context.handle(
        _recipeUrlMeta,
        recipeUrl.isAcceptableOrUnknown(data['recipe_url']!, _recipeUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      diet: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}diet'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calories'],
      )!,
      carbohydrates: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}carbohydrates'],
      )!,
      sugars: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sugars'],
      )!,
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}protein'],
      )!,
      fat: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fat'],
      )!,
      recipeUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_url'],
      )!,
    );
  }

  @override
  $RecipeTableTable createAlias(String alias) {
    return $RecipeTableTable(attachedDatabase, alias);
  }
}

class RecipeTableData extends DataClass implements Insertable<RecipeTableData> {
  final int id;
  final String name;
  final String diet;
  final String imageUrl;
  final int calories;
  final int carbohydrates;
  final int sugars;
  final int protein;
  final int fat;
  final String recipeUrl;
  const RecipeTableData({
    required this.id,
    required this.name,
    required this.diet,
    required this.imageUrl,
    required this.calories,
    required this.carbohydrates,
    required this.sugars,
    required this.protein,
    required this.fat,
    required this.recipeUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['diet'] = Variable<String>(diet);
    map['image_url'] = Variable<String>(imageUrl);
    map['calories'] = Variable<int>(calories);
    map['carbohydrates'] = Variable<int>(carbohydrates);
    map['sugars'] = Variable<int>(sugars);
    map['protein'] = Variable<int>(protein);
    map['fat'] = Variable<int>(fat);
    map['recipe_url'] = Variable<String>(recipeUrl);
    return map;
  }

  RecipeTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeTableCompanion(
      id: Value(id),
      name: Value(name),
      diet: Value(diet),
      imageUrl: Value(imageUrl),
      calories: Value(calories),
      carbohydrates: Value(carbohydrates),
      sugars: Value(sugars),
      protein: Value(protein),
      fat: Value(fat),
      recipeUrl: Value(recipeUrl),
    );
  }

  factory RecipeTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      diet: serializer.fromJson<String>(json['diet']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      calories: serializer.fromJson<int>(json['calories']),
      carbohydrates: serializer.fromJson<int>(json['carbohydrates']),
      sugars: serializer.fromJson<int>(json['sugars']),
      protein: serializer.fromJson<int>(json['protein']),
      fat: serializer.fromJson<int>(json['fat']),
      recipeUrl: serializer.fromJson<String>(json['recipeUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'diet': serializer.toJson<String>(diet),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'calories': serializer.toJson<int>(calories),
      'carbohydrates': serializer.toJson<int>(carbohydrates),
      'sugars': serializer.toJson<int>(sugars),
      'protein': serializer.toJson<int>(protein),
      'fat': serializer.toJson<int>(fat),
      'recipeUrl': serializer.toJson<String>(recipeUrl),
    };
  }

  RecipeTableData copyWith({
    int? id,
    String? name,
    String? diet,
    String? imageUrl,
    int? calories,
    int? carbohydrates,
    int? sugars,
    int? protein,
    int? fat,
    String? recipeUrl,
  }) => RecipeTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    diet: diet ?? this.diet,
    imageUrl: imageUrl ?? this.imageUrl,
    calories: calories ?? this.calories,
    carbohydrates: carbohydrates ?? this.carbohydrates,
    sugars: sugars ?? this.sugars,
    protein: protein ?? this.protein,
    fat: fat ?? this.fat,
    recipeUrl: recipeUrl ?? this.recipeUrl,
  );
  RecipeTableData copyWithCompanion(RecipeTableCompanion data) {
    return RecipeTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      diet: data.diet.present ? data.diet.value : this.diet,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      calories: data.calories.present ? data.calories.value : this.calories,
      carbohydrates: data.carbohydrates.present
          ? data.carbohydrates.value
          : this.carbohydrates,
      sugars: data.sugars.present ? data.sugars.value : this.sugars,
      protein: data.protein.present ? data.protein.value : this.protein,
      fat: data.fat.present ? data.fat.value : this.fat,
      recipeUrl: data.recipeUrl.present ? data.recipeUrl.value : this.recipeUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('diet: $diet, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('calories: $calories, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('sugars: $sugars, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('recipeUrl: $recipeUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    diet,
    imageUrl,
    calories,
    carbohydrates,
    sugars,
    protein,
    fat,
    recipeUrl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.diet == this.diet &&
          other.imageUrl == this.imageUrl &&
          other.calories == this.calories &&
          other.carbohydrates == this.carbohydrates &&
          other.sugars == this.sugars &&
          other.protein == this.protein &&
          other.fat == this.fat &&
          other.recipeUrl == this.recipeUrl);
}

class RecipeTableCompanion extends UpdateCompanion<RecipeTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> diet;
  final Value<String> imageUrl;
  final Value<int> calories;
  final Value<int> carbohydrates;
  final Value<int> sugars;
  final Value<int> protein;
  final Value<int> fat;
  final Value<String> recipeUrl;
  const RecipeTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.diet = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.calories = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.sugars = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
    this.recipeUrl = const Value.absent(),
  });
  RecipeTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String diet,
    required String imageUrl,
    required int calories,
    required int carbohydrates,
    required int sugars,
    required int protein,
    required int fat,
    required String recipeUrl,
  }) : name = Value(name),
       diet = Value(diet),
       imageUrl = Value(imageUrl),
       calories = Value(calories),
       carbohydrates = Value(carbohydrates),
       sugars = Value(sugars),
       protein = Value(protein),
       fat = Value(fat),
       recipeUrl = Value(recipeUrl);
  static Insertable<RecipeTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? diet,
    Expression<String>? imageUrl,
    Expression<int>? calories,
    Expression<int>? carbohydrates,
    Expression<int>? sugars,
    Expression<int>? protein,
    Expression<int>? fat,
    Expression<String>? recipeUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (diet != null) 'diet': diet,
      if (imageUrl != null) 'image_url': imageUrl,
      if (calories != null) 'calories': calories,
      if (carbohydrates != null) 'carbohydrates': carbohydrates,
      if (sugars != null) 'sugars': sugars,
      if (protein != null) 'protein': protein,
      if (fat != null) 'fat': fat,
      if (recipeUrl != null) 'recipe_url': recipeUrl,
    });
  }

  RecipeTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? diet,
    Value<String>? imageUrl,
    Value<int>? calories,
    Value<int>? carbohydrates,
    Value<int>? sugars,
    Value<int>? protein,
    Value<int>? fat,
    Value<String>? recipeUrl,
  }) {
    return RecipeTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      diet: diet ?? this.diet,
      imageUrl: imageUrl ?? this.imageUrl,
      calories: calories ?? this.calories,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      sugars: sugars ?? this.sugars,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      recipeUrl: recipeUrl ?? this.recipeUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (diet.present) {
      map['diet'] = Variable<String>(diet.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    if (carbohydrates.present) {
      map['carbohydrates'] = Variable<int>(carbohydrates.value);
    }
    if (sugars.present) {
      map['sugars'] = Variable<int>(sugars.value);
    }
    if (protein.present) {
      map['protein'] = Variable<int>(protein.value);
    }
    if (fat.present) {
      map['fat'] = Variable<int>(fat.value);
    }
    if (recipeUrl.present) {
      map['recipe_url'] = Variable<String>(recipeUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('diet: $diet, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('calories: $calories, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('sugars: $sugars, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('recipeUrl: $recipeUrl')
          ..write(')'))
        .toString();
  }
}

class $RecipeIngredientsTableTable extends RecipeIngredientsTable
    with TableInfo<$RecipeIngredientsTableTable, RecipeIngredientsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeIngredientsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipe_table (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, recipeId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_ingredients_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeIngredientsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeIngredientsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeIngredientsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $RecipeIngredientsTableTable createAlias(String alias) {
    return $RecipeIngredientsTableTable(attachedDatabase, alias);
  }
}

class RecipeIngredientsTableData extends DataClass
    implements Insertable<RecipeIngredientsTableData> {
  final int id;
  final int recipeId;
  final String name;
  const RecipeIngredientsTableData({
    required this.id,
    required this.recipeId,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['name'] = Variable<String>(name);
    return map;
  }

  RecipeIngredientsTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeIngredientsTableCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      name: Value(name),
    );
  }

  factory RecipeIngredientsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeIngredientsTableData(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'name': serializer.toJson<String>(name),
    };
  }

  RecipeIngredientsTableData copyWith({int? id, int? recipeId, String? name}) =>
      RecipeIngredientsTableData(
        id: id ?? this.id,
        recipeId: recipeId ?? this.recipeId,
        name: name ?? this.name,
      );
  RecipeIngredientsTableData copyWithCompanion(
    RecipeIngredientsTableCompanion data,
  ) {
    return RecipeIngredientsTableData(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientsTableData(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recipeId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeIngredientsTableData &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.name == this.name);
}

class RecipeIngredientsTableCompanion
    extends UpdateCompanion<RecipeIngredientsTableData> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<String> name;
  const RecipeIngredientsTableCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.name = const Value.absent(),
  });
  RecipeIngredientsTableCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required String name,
  }) : recipeId = Value(recipeId),
       name = Value(name);
  static Insertable<RecipeIngredientsTableData> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (name != null) 'name': name,
    });
  }

  RecipeIngredientsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? recipeId,
    Value<String>? name,
  }) {
    return RecipeIngredientsTableCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientsTableCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RecipeTableTable recipeTable = $RecipeTableTable(this);
  late final $RecipeIngredientsTableTable recipeIngredientsTable =
      $RecipeIngredientsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    recipeTable,
    recipeIngredientsTable,
  ];
}

typedef $$RecipeTableTableCreateCompanionBuilder =
    RecipeTableCompanion Function({
      Value<int> id,
      required String name,
      required String diet,
      required String imageUrl,
      required int calories,
      required int carbohydrates,
      required int sugars,
      required int protein,
      required int fat,
      required String recipeUrl,
    });
typedef $$RecipeTableTableUpdateCompanionBuilder =
    RecipeTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> diet,
      Value<String> imageUrl,
      Value<int> calories,
      Value<int> carbohydrates,
      Value<int> sugars,
      Value<int> protein,
      Value<int> fat,
      Value<String> recipeUrl,
    });

final class $$RecipeTableTableReferences
    extends BaseReferences<_$AppDatabase, $RecipeTableTable, RecipeTableData> {
  $$RecipeTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $RecipeIngredientsTableTable,
    List<RecipeIngredientsTableData>
  >
  _recipeIngredientsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeIngredientsTable,
        aliasName: 'recipe_table__id__recipe_ingredients_table__recipe_id',
      );

  $$RecipeIngredientsTableTableProcessedTableManager
  get recipeIngredientsTableRefs {
    final manager = $$RecipeIngredientsTableTableTableManager(
      $_db,
      $_db.recipeIngredientsTable,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeIngredientsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipeTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diet => $composableBuilder(
    column: $table.diet,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get carbohydrates => $composableBuilder(
    column: $table.carbohydrates,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sugars => $composableBuilder(
    column: $table.sugars,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipeUrl => $composableBuilder(
    column: $table.recipeUrl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeIngredientsTableRefs(
    Expression<bool> Function($$RecipeIngredientsTableTableFilterComposer f) f,
  ) {
    final $$RecipeIngredientsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeIngredientsTable,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableTableFilterComposer(
                $db: $db,
                $table: $db.recipeIngredientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecipeTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diet => $composableBuilder(
    column: $table.diet,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get carbohydrates => $composableBuilder(
    column: $table.carbohydrates,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sugars => $composableBuilder(
    column: $table.sugars,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipeUrl => $composableBuilder(
    column: $table.recipeUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipeTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get diet =>
      $composableBuilder(column: $table.diet, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<int> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<int> get carbohydrates => $composableBuilder(
    column: $table.carbohydrates,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sugars =>
      $composableBuilder(column: $table.sugars, builder: (column) => column);

  GeneratedColumn<int> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<int> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<String> get recipeUrl =>
      $composableBuilder(column: $table.recipeUrl, builder: (column) => column);

  Expression<T> recipeIngredientsTableRefs<T extends Object>(
    Expression<T> Function($$RecipeIngredientsTableTableAnnotationComposer a) f,
  ) {
    final $$RecipeIngredientsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeIngredientsTable,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeIngredientsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeIngredientsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecipeTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeTableTable,
          RecipeTableData,
          $$RecipeTableTableFilterComposer,
          $$RecipeTableTableOrderingComposer,
          $$RecipeTableTableAnnotationComposer,
          $$RecipeTableTableCreateCompanionBuilder,
          $$RecipeTableTableUpdateCompanionBuilder,
          (RecipeTableData, $$RecipeTableTableReferences),
          RecipeTableData,
          PrefetchHooks Function({bool recipeIngredientsTableRefs})
        > {
  $$RecipeTableTableTableManager(_$AppDatabase db, $RecipeTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> diet = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<int> calories = const Value.absent(),
                Value<int> carbohydrates = const Value.absent(),
                Value<int> sugars = const Value.absent(),
                Value<int> protein = const Value.absent(),
                Value<int> fat = const Value.absent(),
                Value<String> recipeUrl = const Value.absent(),
              }) => RecipeTableCompanion(
                id: id,
                name: name,
                diet: diet,
                imageUrl: imageUrl,
                calories: calories,
                carbohydrates: carbohydrates,
                sugars: sugars,
                protein: protein,
                fat: fat,
                recipeUrl: recipeUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String diet,
                required String imageUrl,
                required int calories,
                required int carbohydrates,
                required int sugars,
                required int protein,
                required int fat,
                required String recipeUrl,
              }) => RecipeTableCompanion.insert(
                id: id,
                name: name,
                diet: diet,
                imageUrl: imageUrl,
                calories: calories,
                carbohydrates: carbohydrates,
                sugars: sugars,
                protein: protein,
                fat: fat,
                recipeUrl: recipeUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RecipeTableTable, RecipeTableData>(table),
                  $$RecipeTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeIngredientsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recipeIngredientsTableRefs) db.recipeIngredientsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeIngredientsTableRefs)
                    await $_getPrefetchedData<
                      RecipeTableData,
                      $RecipeTableTable,
                      RecipeIngredientsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$RecipeTableTableReferences
                          ._recipeIngredientsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RecipeTableTableReferences(
                            db,
                            table,
                            p0,
                          ).recipeIngredientsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.recipeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RecipeTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeTableTable,
      RecipeTableData,
      $$RecipeTableTableFilterComposer,
      $$RecipeTableTableOrderingComposer,
      $$RecipeTableTableAnnotationComposer,
      $$RecipeTableTableCreateCompanionBuilder,
      $$RecipeTableTableUpdateCompanionBuilder,
      (RecipeTableData, $$RecipeTableTableReferences),
      RecipeTableData,
      PrefetchHooks Function({bool recipeIngredientsTableRefs})
    >;
typedef $$RecipeIngredientsTableTableCreateCompanionBuilder =
    RecipeIngredientsTableCompanion Function({
      Value<int> id,
      required int recipeId,
      required String name,
    });
typedef $$RecipeIngredientsTableTableUpdateCompanionBuilder =
    RecipeIngredientsTableCompanion Function({
      Value<int> id,
      Value<int> recipeId,
      Value<String> name,
    });

final class $$RecipeIngredientsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeIngredientsTableTable,
          RecipeIngredientsTableData
        > {
  $$RecipeIngredientsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipeTableTable _recipeIdTable(_$AppDatabase db) => db.recipeTable
      .createAlias('recipe_ingredients_table__recipe_id__recipe_table__id');

  $$RecipeTableTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipeTableTableTableManager(
      $_db,
      $_db.recipeTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecipeIngredientsTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTableTable> {
  $$RecipeIngredientsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipeTableTableFilterComposer get recipeId {
    final $$RecipeTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipeTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableTableFilterComposer(
            $db: $db,
            $table: $db.recipeTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTableTable> {
  $$RecipeIngredientsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipeTableTableOrderingComposer get recipeId {
    final $$RecipeTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipeTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableTableOrderingComposer(
            $db: $db,
            $table: $db.recipeTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeIngredientsTableTable> {
  $$RecipeIngredientsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$RecipeTableTableAnnotationComposer get recipeId {
    final $$RecipeTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipeTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeIngredientsTableTable,
          RecipeIngredientsTableData,
          $$RecipeIngredientsTableTableFilterComposer,
          $$RecipeIngredientsTableTableOrderingComposer,
          $$RecipeIngredientsTableTableAnnotationComposer,
          $$RecipeIngredientsTableTableCreateCompanionBuilder,
          $$RecipeIngredientsTableTableUpdateCompanionBuilder,
          (RecipeIngredientsTableData, $$RecipeIngredientsTableTableReferences),
          RecipeIngredientsTableData,
          PrefetchHooks Function({bool recipeId})
        > {
  $$RecipeIngredientsTableTableTableManager(
    _$AppDatabase db,
    $RecipeIngredientsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeIngredientsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RecipeIngredientsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RecipeIngredientsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => RecipeIngredientsTableCompanion(
                id: id,
                recipeId: recipeId,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recipeId,
                required String name,
              }) => RecipeIngredientsTableCompanion.insert(
                id: id,
                recipeId: recipeId,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $RecipeIngredientsTableTable,
                    RecipeIngredientsTableData
                  >(table),
                  $$RecipeIngredientsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recipeId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.recipeId,
                        referencedTable: $$RecipeIngredientsTableTableReferences
                            ._recipeIdTable(db),
                        referencedColumn:
                            $$RecipeIngredientsTableTableReferences
                                ._recipeIdTable(db)
                                .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RecipeIngredientsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeIngredientsTableTable,
      RecipeIngredientsTableData,
      $$RecipeIngredientsTableTableFilterComposer,
      $$RecipeIngredientsTableTableOrderingComposer,
      $$RecipeIngredientsTableTableAnnotationComposer,
      $$RecipeIngredientsTableTableCreateCompanionBuilder,
      $$RecipeIngredientsTableTableUpdateCompanionBuilder,
      (RecipeIngredientsTableData, $$RecipeIngredientsTableTableReferences),
      RecipeIngredientsTableData,
      PrefetchHooks Function({bool recipeId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RecipeTableTableTableManager get recipeTable =>
      $$RecipeTableTableTableManager(_db, _db.recipeTable);
  $$RecipeIngredientsTableTableTableManager get recipeIngredientsTable =>
      $$RecipeIngredientsTableTableTableManager(
        _db,
        _db.recipeIngredientsTable,
      );
}
