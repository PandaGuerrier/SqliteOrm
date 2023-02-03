import 'dart:io';

import 'package:mineral_ioc/ioc.dart';
import 'package:mineral_package/mineral_package.dart';
import 'package:mineral_sqliteorm/mineral_sqlite_orm.dart';
import 'package:mineral_sqliteorm/src/contracts/migration.dart';
import 'package:mineral_sqliteorm/src/entities/generate_table.dart';

class PluginManagerCraft extends MineralService {
  final Map<dynamic, MineralPackage> packages = {};
  T use<T extends MineralPackage> () => packages[T] as T;
}

class FooModel extends Schema<FooModel> implements Migration {

  @override
  String get tableName => "foo";

  @override
  Future<void> up() async {
    final columns = GenerateTable(tableName)
    ..setId()
    ..addInt("bar")
    ..addStr("bfo");

    DatabaseEntities().createTable(tableName, columns);
  }
}

class PandaModel extends Schema<PandaModel> implements Migration {
  @override
  String get tableName => "panda";

  @override
  Future<void> up() async {
    final columns = GenerateTable(tableName)
      ..setId()
      ..addInt("bite")
      ..addStr("bi")
      ..addText("txt");

    DatabaseEntities().createTable(tableName, columns);
  }
}
enum Tbles {
 TABLE;
}

void main() async {
  final orm = SqliteOrm([
    FooModel(),
    PandaModel(),
  ]);
  await orm.init();


  FooModel fooModel = FooModel();
  sleep(Duration(seconds: 2));


  // fooModel.set(String columnName, dynamic value)
// await fooModel.set({ "intest": 0 });
// await fooModel.set({ "bar": 999, "bfo": "zub" });
/*
 // pour print toutes les valeurs
  print(fooModel.query());

  // pour avoir une valeur en particulier
  List<Row> row = fooModel.where("intest", 0);

  print(row.first);

  // maintenant on va prendre toutes les valeurs*/
  /* fooModel.update({
    "bar": 6,
    "bfo": "bite"
  },
      "id", 1);
}*/
  fooModel.delete("id", 1);
}
// oui du coup ça a recréer vu que j'ai oublié de commenté la ligne :(
// maintenant on print que la valeur avec 0

// todo: faire un jolie message + une jolie vidéo de présentation