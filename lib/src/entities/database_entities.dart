import 'package:mineral_sqliteorm/mineral_sqlite_orm.dart';
import 'package:mineral_sqliteorm/src/connections/db_connect.dart';
import 'package:mineral_sqliteorm/src/entities/generate_table.dart';
import 'package:sqlite3/sqlite3.dart';

class DatabaseEntities {
  Database _database () {
    return DbConnect().connect();
  }

  Database get database => _database();

  Future<void> createTable(String tableName, GenerateTable columns) async {
    String columnsStr = columns.columns.map((e) => e.toString().split('.').last).join(', ');
    database.execute("CREATE TABLE IF NOT EXISTS $tableName ($columnsStr)");
  }
}