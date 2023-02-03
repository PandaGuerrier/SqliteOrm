import 'package:mineral_sqliteorm/mineral_sqlite_orm.dart';
import 'package:mineral_sqliteorm/src/contracts/metadata_contract.dart';
import 'package:mineral_sqliteorm/src/contracts/schema_contract.dart';
import 'package:mineral_sqliteorm/src/utils/connexion.dart';

class Metadata extends MetadataContract {
  final Map<Symbol, dynamic> _payload = {};

  @override
  dynamic get(String key) => _payload[Symbol(key)];

  void put(String key, dynamic value) =>
      _payload.putIfAbsent(Symbol(key), () => value);
}

class Schema<T> implements SchemaContract<T> {
  final Metadata _metadata = Metadata();

  @override
  MetadataContract get payload => _metadata;

  String get tableName => payload.get('table_name');

  Database _database() {
    return Connexion().connexion;
  }

  @override
  Future<void> dropTable() async {
    _database().execute("DROP TABLE IF EXISTS $tableName");
  }

  @override
  Future<T> update(Map<String, dynamic> values, String whereColumn, dynamic whereValue) async {
    String columnsStr = values.entries.map((e) => '${e.key} = ?').join(', ');
   _database().prepare("UPDATE $tableName SET $columnsStr WHERE $whereColumn = $whereValue")
       .execute([...values.entries.map((e) => e.value.toString())]);

    return this as T;
  }

  @override
  Future<T> create(Map<String, dynamic> values) async {
    String columnsStr = values.entries.map((e) => '${e.key}').join(', ');

    _database()
        .prepare("INSERT INTO $tableName ($columnsStr) VALUES (${values.entries.map((e) => "?").join(", ")})")
        .execute([...values.entries.map((e) => e.value.toString())]);

    return this as T;
  }

  @override
  ResultSet query() {
    return _database().select("SELECT * FROM $tableName");
  }

  @override
  List<Row> where(String column, value) {
    ResultSet rs = _database().select("SELECT * FROM $tableName WHERE $column = '$value'");
    List<Row> rowList = [];

    for (Row row in rs) {
      rowList.add(row);
    }

    return rowList;
  }

  @override
  void delete(String column, value) {
    _database().execute("DELETE FROM $tableName WHERE $column = $value");
  }

  @override
  ResultSet random() {
    return _database().select("SELECT * FROM $tableName ORDER BY RAND() LIMIT 1");
  }
}
