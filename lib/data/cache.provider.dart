import 'package:hive_flutter/hive_flutter.dart';

class CacheProvider<T> {
  static const String historyBox = 'history_box';

  final Box<T> boxInstance;

  const CacheProvider(this.boxInstance);

  Future<int> insert(T object) async => boxInstance.add(object);
  Iterable<T> readAll() => boxInstance.values;
  Future<void> deleteAt(int index) async => await boxInstance.deleteAt(index);
}
