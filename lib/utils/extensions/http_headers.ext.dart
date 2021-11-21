import 'dart:io';

extension HttpHeadersExt on HttpHeaders {
  void addAll(Map<String, String>? headers) {
    if (headers != null) {
      for (var item in headers.entries) {
        add(item.key, item.value);
      }
    }
  }
}
