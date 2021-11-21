import 'package:equatable/equatable.dart';
import 'package:urlshorty/blocs/status.enum.dart';
import 'package:urlshorty/data/models/gotiny_response.model.dart';

class GoTinyState extends Equatable {
  final StateStatus status;
  final GoTinyResponseModel? data;
  final String? errorMessage;

  const GoTinyState({
    required this.status,
    this.data,
    this.errorMessage,
  });

  factory GoTinyState.initial() => const GoTinyState(
        status: StateStatus.initial,
        data: null,
        errorMessage: null,
      );

  factory GoTinyState.loading() => const GoTinyState(
        status: StateStatus.loading,
      );

  factory GoTinyState.successful(GoTinyResponseModel data) => GoTinyState(
        status: StateStatus.successful,
        data: data,
      );

  factory GoTinyState.failed(String errorMessage) => GoTinyState(
        status: StateStatus.failed,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props => [status, data, errorMessage];
}
