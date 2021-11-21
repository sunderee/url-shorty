import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshorty/data/models/url_history.model.dart';
import 'package:urlshorty/data/repositories/history.repository.dart';

class HistoryCubit extends Cubit<List<URLHistoryModel>> {
  final IHistoryRepository _repository;

  HistoryCubit(
    IHistoryRepository historyRepository,
  )   : _repository = historyRepository,
        super(<URLHistoryModel>[]);

  void requestHistory() {
    emit(_repository.retrieveHistory());
  }
}
