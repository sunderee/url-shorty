import 'dart:convert';
import 'dart:io';

import 'package:urlshorty/utils/extensions/http_headers.ext.dart';
import 'package:urlshorty/utils/types/json.type.dart';

class ApiProvider {
  final HttpClient client = HttpClient();
  final String _baseURL;

  ApiProvider(String baseURL) : _baseURL = baseURL;

  Future<String> makePostRequest(
    String endpoint,
    JsonObject body,
    Map<String, String> headers,
  ) async {
    final url = Uri.https(_baseURL, endpoint);
    final request = await client.postUrl(url)
      ..headers.addAll(headers)
      ..write(json.encode(body));

    final response = await request.close();

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ApiException(
        response.statusCode,
        response.reasonPhrase,
      );
    }
    final responseBody = await response
        .transform(const Utf8Decoder(allowMalformed: true))
        .reduce((String previous, String element) => previous + element);
    return responseBody;
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String cause;

  const ApiException(this.statusCode, this.cause);

  @override
  String toString() => '$statusCode: $cause';
}
