import 'package:mineral_sqliteorm/src/contracts/migration.dart';
import 'package:mineral_sqliteorm/src/contracts/static_schema_contract.dart';
import 'package:mineral_sqliteorm/mineral_sqlite_orm.dart';

typedef ModelFactory = List<Migration>;

abstract class SqliteOrmContract {
  ModelFactory get models;

  /// Retrieves the specified model from the application instance
  /// ```dart
  /// class FooModel extends Schema {
  ///   late String username;
  ///   late int age;
  /// }
  ///
  /// class MyClass with Transaction {
  ///   Future<void> handle () async {
  ///     final model = schema.use<FooModel>();
  ///   }
  /// }
  /// ```
  StaticSchemaContract<T> use<T extends Schema> ();


  /// Delete the database
  /// ```dart
  /// class MyClass with Transaction {
  ///   Future<void> handle () async {
  ///     await schema.dropDatabase();
  ///   }
  /// }
  /// ```
  /// The action requires special permission to operate.
  Future<void> dropDatabase ();

}