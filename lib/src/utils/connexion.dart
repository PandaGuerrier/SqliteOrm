import 'package:mineral_sqliteorm/mineral_sqlite_orm.dart';

Database? _connexion;
bool _isConnected = false;

class Connexion {
  Database get connexion => _connexion!;
  bool get isConnected => _isConnected;

  void setConnexion(Database connexion) => _connexion = connexion;
  void setConnected(bool connected) => _isConnected = connected;
}