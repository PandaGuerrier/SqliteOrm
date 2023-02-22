import 'package:mineral_sqliteorm/src/contracts/metadata_contract.dart';

import '../../mineral_sqlite_orm.dart';

abstract class SchemaContract<T> {
    MetadataContract get payload;

    ///
    /// class BarModel extends Schema<BarModel> {
    ///
    ///  String get user => payload.get('user')
    ///  ...
    /// }
    ///
    /// class MyClass with Transaction {
    ///
    ///     Future<>...
    ///
    /// }
    Future<T> update (Map<String, dynamic> values, String whereColumn, dynamic whereValue);
    Future<T> create (Map<String, dynamic> values);

    Future<void> dropTable ();
    void delete(String column, dynamic value);

    ResultSet query();
    Row where(String column, dynamic value);
    ResultSet random();
}