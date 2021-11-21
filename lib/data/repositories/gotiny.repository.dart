import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:urlshorty/data/api.provider.dart';
import 'package:urlshorty/data/models/gotiny_request.model.dart';
import 'package:urlshorty/data/models/gotiny_response.model.dart';
import 'package:urlshorty/utils/tuple.dart';
import 'package:urlshorty/utils/types/json.type.dart';

Future<GoTinyResponseModel> _shortenURLIsolate(
  Pair<ApiProvider, GoTinyRequestModel> input,
) async {
  final rawResponse = await input.first.makePostRequest(
    'api',
    input.second.toJson(),
    {
      HttpHeaders.contentTypeHeader: ContentType.json.toString(),
    },
  );
  final response = json.decode(rawResponse) as JsonObject;
  return GoTinyResponseModel.fromJson(response);
}

abstract class IGoTinyRepository {
  Future<GoTinyResponseModel> shortenURL(String inputURL);
}

class GoTinyRepository implements IGoTinyRepository {
  final ApiProvider _provider;

  const GoTinyRepository(
    ApiProvider apiProvider,
  ) : _provider = apiProvider;

  @override
  Future<GoTinyResponseModel> shortenURL(String inputURL) {
    return compute<Pair<ApiProvider, GoTinyRequestModel>, GoTinyResponseModel>(
      _shortenURLIsolate,
      Pair(
        _provider,
        GoTinyRequestModel(inputURL),
      ),
    );
  }
}
