import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';

void main() {
  setUp(() async {
    await Hive.initFlutter();
  });
  test("Hive Open Box", () async {
    Box<String> box = await Hive.openBox<String>('zemin');
    expect(box.isOpen, true);
  });

  test("Add Item To Box", () async {
    Box<String> box = Hive.box<String>('zemin');
    await box.add("Bilal");
    expect(box.values.first, "Bilal");
  });

  test("Add Item To Box With Key", () async {
    Box<String> box = Hive.box<String>('zemin');
    await box.put('username', "cameloott");
    expect(box.get('username'), "cameloott");
  });

  test("Delete Item Form Box", () async {
    Box<String> box = Hive.box<String>('zemin');
    var boxValueLength = box.values.length;
    await box.delete('username');
    expect(box.values.length, boxValueLength - 1);
  });
  test("Clear Item Form Box", () async {
    Box<String> box = Hive.box<String>('zemin');
    await box.clear();
    expect(box.values.length, 0);
  });
  test("Close Box", () async {
    Box<String> box = Hive.box<String>('zemin');
    await box.close();
    expect(box.isOpen, false);
  });
}
