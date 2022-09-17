# Hive In Flutter 
Made for Zemin Istanbul Presantation

## Localization aka l10n
Basically, the application saves the basic data types and custom generated data classes to the local storage.

## Getting Started

### Dependencies 🧰

#### Package
```
dependencies:
  hive_flutter: ^1.1.0 //add this line

dev_dependencies:
  build_runner: ^2.2.1 //add this line
  hive_generator: ^1.1.3 //add this line
```

- hive_flutter
> Provides operations on the local storage.
- build_runner
> Provides a concrete way of generating files using Dart code.
- hive_generator
> Provides automatic generation of TypeAdapters for almost any class.

## Project Architecture Output
    .
    ├── lib                  
        ├── core
            └── service
                ├── cache
                    ├── base_cache_manager.dart
                    └── cache_enums.dart   
        ├── model
            ├── todo_model.dart
            └── todo_model.g.dart
        └── product
            └── todo
                ├── todo_service.dart
                └── todo_view.dart
    └── main.dart

## Base Functions & Hive Classes

### Base Functions
- Initialize Hive
```
  await Hive.initFlutter();
```
- Open Hive Box
```
Future<void> boxInit() async {
  await Hive.openBox(boxName);
}
```
- Add item to box with auto increment key
```
Future<void> addItemWithAutoIncrementKey(T item) async {
  await _box!.add(item);
}
```
- Add item to box with custom key
```
Future<void> addItemWithCustomKey(dynamic key, T item) async {
  await _box!.put(key, item);
}
```
- Get item from box
```
T? getItem(dynamic key) {
  return _box!.get(key);
}
```
- Remove item from box
```
Future<void> removeItem(dynamic key) async {
  await _box!.delete(key);
}
```
- Clear box
```
Future<void> clearBox() async {
  await _box!.clear();
}
```
- Close box
```
Future<void> closeBox() async {
  await _box!.close();
}
```

### Hive Classes
- Class Architecture
```
import 'package:hive_flutter/adapters.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  int? userId;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? title;
  @HiveField(3)
  bool? completed;

  Todo({this.userId, this.id, this.title, this.completed});

  Todo.fromJson(Map<String, dynamic> json) {...}
  Map<String, dynamic> toJson() {...}
}
```
- Generate Part File Command
```
flutter pub run build_runner build
```

## Create an Manager from Generic Cache Manager

- initialize
```
final BaseCacheManager<Todo> _todoCacheManager = BaseCacheManager<Todo>(boxName: CacheBoxNames.todo);
Future<void> serviceInit() async {
  await _todoCacheManager.boxInit();
}
```

## Usage 🛠
When the manager is generated and initialized, it can accesses and uses generic cache manager functions.
```
await _todoCacheManager.boxInit();
_todoCacheManager.getItemList();
await _todoCacheManager.addItemList(items);
await _todoCacheManager.clearBox();
...
```

### Source
[Hive Documentation](https://docs.hivedb.dev/)