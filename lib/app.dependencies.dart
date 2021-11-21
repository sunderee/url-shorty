import 'package:hive_flutter/hive_flutter.dart';
import 'package:urlshorty/data/api.provider.dart';
import 'package:urlshorty/data/cache.provider.dart';
import 'package:urlshorty/data/models/url_history.model.dart';
import 'package:urlshorty/data/repositories/gotiny.repository.dart';
import 'package:urlshorty/data/repositories/history.repository.dart';

class AppDependencies {
  static IGoTinyRepository goTinyRepositoryInstance() {
    final provider = ApiProvider('gotiny.cc');
    return GoTinyRepository(provider);
  }

  static IHistoryRepository historyRepositoryInstance() {
    final box = Hive.box<URLHistoryModel>(CacheProvider.historyBox);
    final cacheProvider = CacheProvider<URLHistoryModel>(box);
    return HistoryRepository(cacheProvider);
  }

  const AppDependencies._();
}
