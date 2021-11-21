import 'package:meta/meta.dart';

@immutable
@sealed
class Pair<A, B> {
  final A first;
  final B second;

  @literal
  const Pair(
    this.first,
    this.second,
  );
}

@immutable
@sealed
class Triple<A, B, C> {
  final A first;
  final B second;
  final C third;

  @literal
  const Triple(
    this.first,
    this.second,
    this.third,
  );
}
