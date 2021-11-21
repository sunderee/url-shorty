import 'package:urlshorty/data/cache.provider.dart';
import 'package:urlshorty/data/models/gotiny_response.model.dart';
import 'package:urlshorty/data/models/url_history.model.dart';

abstract class IHistoryRepository {
  Future<void> storeLinkToHistory(GoTinyResponseModel data);
  List<URLHistoryModel> retrieveHistory();
}

class HistoryRepository implements IHistoryRepository {
  final CacheProvider<URLHistoryModel> _cacheProvider;

  HistoryRepository(
    CacheProvider<URLHistoryModel> urlHistoryCacheProvider,
  ) : _cacheProvider = urlHistoryCacheProvider;

  @override
  Future<void> storeLinkToHistory(GoTinyResponseModel data) async {
    await _cacheProvider.insert(
      URLHistoryModel(
        data.shortURL,
        data.longURL,
        DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  @override
  List<URLHistoryModel> retrieveHistory() {
    return _cacheProvider.readAll().toList();
  }
}
