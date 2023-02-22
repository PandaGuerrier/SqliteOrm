class TestTable {
  void printEnum<T extends Enum>(T data) {
    print(data.name);  // all Enums have a .name
  }
}


class GenerateTable {
  late String tableName;
  final List<String> _columns = [];

  GenerateTable(String tableName);

  List<String> get columns => _columns;

  void setUuid() {
    columns.add("uuid VARCHAR(255) PRIMARY KEY");
  }

  void setId({ String tableName = "id" }) {
    columns.add("$tableName INTEGER PRIMARY KEY");
  }

  void addStr(String columnName, { bool isNullable = false, dynamic defaultTo = "", bool isPrimary = false  }) {
    columns.add("$columnName VARCHAR(255) ${isNullable ? "" : "NOT NULL"} ${defaultTo.toString().isEmpty ? "" : "DEFAULT '$defaultTo'"} ${isPrimary ? "PRIMARY KEY" : ""}");
  }

  void addInt(String columnName, { bool isNullable = false, dynamic defaultTo = "", bool isPrimary = false  }) {
    columns.add("$columnName INTEGER ${isNullable ? "" : "NOT NULL"} ${defaultTo.toString().isEmpty ? "" : "DEFAULT '$defaultTo'"} ${isPrimary ? "PRIMARY KEY" : ""}");
  }

  void addText(String columnName, { bool isNullable = false, dynamic defaultTo = "", bool isPrimary = false  }) {
    columns.add("$columnName TEXT ${isNullable ? "" : "NOT NULL"} ${defaultTo.toString().isEmpty ? "" : "DEFAULT '$defaultTo'"} ${isPrimary ? "PRIMARY KEY" : ""}");
  }

  void addBool(String columnName, { bool isNullable = false, dynamic defaultTo = "", bool isPrimary = false  }) {
    columns.add("$columnName BOOL ${isNullable ? "" : "NOT NULL"} ${defaultTo.toString().isEmpty ? "" : "DEFAULT '$defaultTo'"} ${isPrimary ? "PRIMARY KEY" : ""}");
  }
}