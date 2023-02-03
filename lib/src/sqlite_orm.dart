import 'dart:io';
import 'package:mineral_package/mineral_package.dart';
import 'package:mineral_sqliteorm/mineral_sqlite_orm.dart';
import 'package:mineral_sqliteorm/src/contracts/migration.dart';
import 'package:mineral_sqliteorm/src/contracts/sqliteorm_contract.dart';
import 'package:mineral_sqliteorm/src/contracts/static_schema_contract.dart';
import 'package:mineral_sqliteorm/src/entities/schema.dart';
import 'package:mineral_sqliteorm/src/utils/connexion.dart';

import 'connections/db_connect.dart';

class SqliteOrm extends MineralPackage implements SqliteOrmContract {
  @override
  String namespace = 'Mineral/Plugins/SqliteOrm';

  @override
  String label = 'SqliteOrm';

  @override
  String description = 'The SqliteOrm module was designed exclusively for the Mineral framework, it allows you to communicate with a SqliteOrm database file.';

  @override
  ModelFactory get models => _models;

  late File? _dbFile;
  final ModelFactory _models;

  SqliteOrm(this._models);

  @override
  Future<void> init() async {
    for (Migration model in models) {
      model.up();
    }
  }

  @override
  Future<void> dropDatabase() async {
    _dbFile!.delete(recursive: true);
  }

  @override
  StaticSchemaContract<T> use<T extends Schema>() {
    // TODO: implement use
    throw UnimplementedError();
  }
}
