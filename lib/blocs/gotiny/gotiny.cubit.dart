import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshorty/blocs/gotiny/gotiny.state.dart';
import 'package:urlshorty/data/api.provider.dart';
import 'package:urlshorty/data/repositories/gotiny.repository.dart';
import 'package:urlshorty/data/repositories/history.repository.dart';

class GoTinyCubit extends Cubit<GoTinyState> {
  final IGoTinyRepository _repository;
  final IHistoryRepository _historyRepository;

  GoTinyCubit(
    IGoTinyRepository goTinyRepository,
    IHistoryRepository historyRepository,
  )   : _repository = goTinyRepository,
        _historyRepository = historyRepository,
        super(GoTinyState.initial());

  Future<void> shortenURL(String inputURL) async {
    emit(GoTinyState.loading());
    try {
      final result = await _repository.shortenURL(inputURL);
      await _historyRepository.storeLinkToHistory(result);
      emit(GoTinyState.successful(result));
    } on ApiException catch (e) {
      print(e.toString());
      emit(GoTinyState.failed(e.toString()));
    } catch (e) {
      print(e);
      emit(GoTinyState.failed('Unknown exception'));
    }
  }
}
