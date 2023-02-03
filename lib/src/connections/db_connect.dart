import 'dart:ffi';
import 'dart:io';

import 'package:mineral_sqliteorm/mineral_sqlite_orm.dart';
import 'package:mineral_sqliteorm/src/utils/connexion.dart';
import 'package:path/path.dart';

class DbConnect {
  Connexion databaseConnexion = Connexion();

  Database connect()  {
    if(databaseConnexion.isConnected) {
      return databaseConnexion.connexion;
    }

    File dbFile = File(join(Directory.current.path, "db", "database.db"));
    if (!dbFile.existsSync()) {
      dbFile.createSync(recursive: true);
    }

    _openOnLinux();
    Database connexion = sqlite3.open(dbFile.path);
    databaseConnexion.setConnexion(connexion);
    databaseConnexion.setConnected(true);

    return connexion;
  }

  DynamicLibrary _openOnLinux() {
    final scriptDir = File(Platform.script.toFilePath()).parent;
    final libraryNextToScript = File('${scriptDir.path}/sqlite3.so');
    return DynamicLibrary.open(libraryNextToScript.path);
  }
}
