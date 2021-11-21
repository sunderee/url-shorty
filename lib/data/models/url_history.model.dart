import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'url_history.model.g.dart';

@HiveType(typeId: 1)
@immutable
class URLHistoryModel {
  @HiveField(0)
  final String shortURL;

  @HiveField(1)
  final String longURL;

  @HiveField(2)
  final int timestamp;

  const URLHistoryModel(
    this.shortURL,
    this.longURL,
    this.timestamp,
  );
}
