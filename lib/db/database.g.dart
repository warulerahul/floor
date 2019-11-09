// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorTestDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TestDatabaseBuilder databaseBuilder(String name) =>
      _$TestDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TestDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$TestDatabaseBuilder(null);
}

class _$TestDatabaseBuilder {
  _$TestDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$TestDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$TestDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<TestDatabase> build() async {
    final database = _$TestDatabase();
    database.database = await database.open(
      name ?? ':memory:',
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TestDatabase extends TestDatabase {
  _$TestDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DogDao _dogDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations,
      [Callback callback]) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `dog` (`id` INTEGER, `nick_name` TEXT, `owner_id` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  DogDao get dogDao {
    return _dogDaoInstance ??= _$DogDao(database, changeListener);
  }
}

class _$DogDao extends DogDao {
  _$DogDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _dogInsertionAdapter = InsertionAdapter(
            database,
            'dog',
            (Dog item) => <String, dynamic>{
                  'id': item.id,
                  'nick_name': item.nickName,
                  'owner_id': item.ownerId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _dogMapper = (Map<String, dynamic> row) =>
      Dog(row['id'] as int, row['nick_name'] as String, row['owner_id'] as int);

  final InsertionAdapter<Dog> _dogInsertionAdapter;

  @override
  Future<Dog> findDogForPersonId(int id) async {
    return _queryAdapter.query('SELECT * FROM dog WHERE owner_id = ?',
        arguments: <dynamic>[id], mapper: _dogMapper);
  }

  @override
  Future<List<Dog>> findAllDogs() async {
    return _queryAdapter.queryList('SELECT * FROM dog', mapper: _dogMapper);
  }

  @override
  Future<void> insertDog(Dog dog) async {
    await _dogInsertionAdapter.insert(dog, sqflite.ConflictAlgorithm.abort);
  }
}
