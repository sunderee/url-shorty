import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshorty/blocs/gotiny/gotiny.state.dart';
import 'package:urlshorty/data/api.provider.dart';
import 'package:urlshorty/data/repositories/gotiny.repository.dart';

class GoTinyCubit extends Cubit<GoTinyState> {
  final IGoTinyRepository _repository;

  GoTinyCubit(
    IGoTinyRepository goTinyRepository,
  )   : _repository = goTinyRepository,
        super(GoTinyState.initial());

  Future<void> shortenURL(String inputURL) async {
    emit(GoTinyState.loading());
    try {
      final result = await _repository.shortenURL(inputURL);
      emit(GoTinyState.successful(result));
    } on ApiException catch (e) {
      emit(GoTinyState.failed(e.toString()));
    } catch (_) {
      emit(GoTinyState.failed('Unknown exception'));
    }
  }
}
