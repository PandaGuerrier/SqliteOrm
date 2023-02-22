abstract class Migration {
  String get tableName;

  Future<void> up ();
}