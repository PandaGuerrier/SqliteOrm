# 📦 MongoDB

The mongoDB module was designed exclusively for the Mineral framework, it allows you to communicate with a MongoDB
database.

## Register the module
After installing the module, please register it within `./src/main.dart` following the scheme below

```dart
import 'package:mineral_mongodb/mineral_sqlite_orm.dart';

Future<void> main() async {
  final mongoDB = MongoDB({
    FooModel: () => FooModel()
  });

  Kernel kernel = Kernel()
    ..intents.defined(all: true)
    ..plugins.use([mongoDB]);

  await kernel.init();
}
```

## Usage
Like a classic use of MongoDB technology, the Mineral framework requires you to use Models representing your noSQL schema.

We will create our first model :
```dart
class FooModel extends Schema<FooModel> {
  String get bar => payload.get('bar');
}
```

### Get all foo
```dart
import 'package:mineral_mongodb/mineral_sqlite_orm.dart';

class MyClass with Transaction {
  Future<void> handle (event) async {
    final result = await schema.use<FooModel>().all();
    print(result);
  }
}
```

### Find one foo
```dart
import 'package:mineral_mongodb/mineral_sqlite_orm.dart';

class MyClass with Transaction {
  Future<void> handle (event) async {
    final result = await schema.use<FooModel>().find('1234');
    print(result);
  }
}
```

### Find one foo from defined column
```dart
import 'package:mineral_mongodb/mineral_sqlite_orm.dart';

class MyClass with Transaction {
  Future<void> handle (event) async {
    final result = await schema.use<FooModel>().findBy('column', 'value');
    print(result);
  }
}
```


### Create one foo
```dart
import 'package:mineral_mongodb/mineral_sqlite_orm.dart';

class MyClass with Transaction {
  Future<void> handle (event) async {
    final result = await schema.use<FooModel>().create({ bar: 'bar' });
    print(result);
  }
}
```

### Create many foo
```dart
import 'package:mineral_mongodb/mineral_sqlite_orm.dart';

class MyClass with Transaction {
  Future<void> handle (event) async {
    final result = await schema.use<FooModel>().createMany([
      { bar: 'Bar1' },
      { bar: 'Bar2' }
    ]);
    
    print(result);
  }
}
```

### Update one foo
```dart
import 'package:mineral_mongodb/mineral_sqlite_orm.dart';

class MyClass with Transaction {
  Future<void> handle (event) async {
    final foo = await schema.use<FooModel>().find('1234');
    final result = await foo?.update({ bar: 'foo' });
    
    print(result);
  }
}
```

### Delete one foo
```dart
import 'package:mineral_mongodb/mineral_sqlite_orm.dart';

class MyClass with Transaction {
  Future<void> handle (event) async {
    await schema.use<FooModel>().delete();
  }
}
```

### Access to mongodb query builder
```dart
import 'package:mineral_mongodb/mineral_sqlite_orm.dart';

class MyClass with Transaction {
  Future<void> handle (event) async {
    await schema.use<FooModel>().query();
  }
}
```