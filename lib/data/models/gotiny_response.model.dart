import 'package:meta/meta.dart';
import 'package:urlshorty/utils/types/json.type.dart';

@immutable
class GoTinyResponseModel {
  final String longURL;
  final String shortURLCode;

  String get shortURL => 'https://gotiny.cc/$shortURLCode';

  const GoTinyResponseModel._(this.longURL, this.shortURLCode);

  factory GoTinyResponseModel.fromJson(JsonObject json) =>
      GoTinyResponseModel._(
        json['long'] as String,
        json['code'] as String,
      );
}
