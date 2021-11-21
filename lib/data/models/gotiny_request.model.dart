import 'package:meta/meta.dart';
import 'package:urlshorty/utils/types/json.type.dart';

@immutable
class GoTinyRequestModel {
  final String inputURL;

  const GoTinyRequestModel(this.inputURL);

  JsonObject toJson() => <String, String>{
        'input': inputURL,
      };
}
