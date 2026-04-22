import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class LocalCacheService<T> {
  Future<List<T>?> getList({
    required String key,
    required String boxName,
  }) async {
    final box = Hive.box(boxName);
    final data = box.get(key);
    if (data is! List) return null;
    return data.cast<T>();
  }

  Future<void> saveList({
    required String key,
    required String boxName,
    required List<T> list,
  }) async {
    final box = Hive.box(boxName);
    await box.put(key, list);
  }

  Future<void> save({
    required String key,
    required String boxName,
    required dynamic value,
  }) async {
    final box = Hive.box(boxName);
    await box.put(key, value);
  }

  Future<dynamic> get({required String key, required String boxName}) async {
    final box = Hive.box(boxName);
    return box.get(key);
  }

  Future<void> clear({required String key, required String boxName}) async {
    final box = Hive.box(boxName);
    await box.delete(key);
  }

  Future<void> clearAll({required String boxName}) async {
    final box = Hive.box(boxName);
    await box.clear();
  }
}
