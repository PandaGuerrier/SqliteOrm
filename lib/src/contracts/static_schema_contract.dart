
abstract class StaticSchemaContract<T> {
  /// Access point to mongodb's native query builder as [DbCollection]
  /// ```dart
  /// class Model extends Schema<Model> {
  ///   String get username => payload.get('username');
  ///   int get age => payload.get('age');
  /// }
  ///
  /// final DbCollection = Schema.query<Model>();
  /// ```
  dynamic query ();

  /// Delete the current collection
  /// ```dart
  /// class Model extends Schema {
  ///   String get username => payload.get('username');
  ///   int get age => payload.get('age');
  /// }
  ///
  /// await Schema.dropCollection();
  /// ```
  Future<bool> dropCollection ();

  /// Empty the entire current collection
  /// ```dart
  /// class FooModel extends Schema<FooModel> {
  ///   String get username => payload.get('username');
  ///   int get age => payload.get('age');
  /// }
  ///
  /// class MyClass with Transaction {
  ///   Future<void> handle () async {
  ///     await schema.use<FooModel>().clear();
  ///   }
  /// }
  /// ```
  Future<bool> clear ();

  /// Get the whole data of the current schema
  /// ```dart
  /// class FooModel extends Schema<FooModel> {
  ///   String get username => payload.get('username');
  ///   int get age => payload.get('age');
  /// }
  ///
  /// class MyClass with Transaction {
  ///   Future<void> handle () async {
  ///     final foo = await schema.use<FooModel>().all();
  ///     print(foo.length); 👈 xx
  ///   }
  /// }
  /// ```
  Future<List<T>> all ();

  /// Retrieves the first item found according to a [column] and a [value]
  /// ```dart
  /// class FooModel extends Schema<FooModel> {
  ///   String get username => payload.get('username');
  ///   int get age => payload.get('age');
  /// }
  ///
  /// class MyClass with Transaction {
  ///   Future<void> handle () async {
  ///     final foo = await schema.use<FooModel>().findBy({ username: 'Freeze' });
  ///     print(foo?.username); 👈 Freeze
  ///   }
  /// }
  /// ```
  Future<T?> findBy (String column, dynamic value);

  /// Retrieves the first item found according to the _id column from a [value]
  /// ```dart
  /// class FooModel extends Schema<FooModel> {
  ///   String get username => payload.get('username');
  ///   int get age => payload.get('age');
  /// }
  ///
  /// class MyClass with Transaction {
  ///   Future<void> handle () async {
  ///     final foo = await schema.use<FooModel>().find('1234');
  ///     print(foo?.username); 👈 Freeze
  ///   }
  /// }
  /// ```
  Future<T?> find (String value);

  /// Created a new entry in the current collection
  /// ```dart
  /// class FooModel extends Schema<FooModel> {
  ///   String get username => payload.get('username');
  ///   int get age => payload.get('age');
  /// }
  ///
  /// class MyClass with Transaction {
  ///   Future<void> handle () async {
  ///     final foo = await schema.use<FooModel>().create({
  ///       'username': 'Freeze',
  ///       'age': 26
  ///     });
  ///
  ///     print(foo.username); 👈 Freeze
  ///   }
  /// }
  /// ```
  Future<T> create (Map<String, dynamic> values);

  /// Created several new entries in the current collection
  /// ```dart
  /// class FooModel extends Schema<FooModel> {
  ///   String get username => payload.get('username');
  ///   int get age => payload.get('age');
  /// }
  ///
  /// class MyClass with Transaction {
  ///   Future<void> handle () async {
  ///     final foo = await schema.use<FooModel>().createMany([
  ///       { 'username': 'Freeze', 'age': 26 },
  ///       { 'username': 'John', 'age': 26 }
  ///     ]);
  ///
  ///     print(foo.length); 👈 2
  ///   }
  /// }
  /// ```
  Future<List<T>> createMany (List<Map<String, dynamic>> values);
}