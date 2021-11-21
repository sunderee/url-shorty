import 'package:urlshorty/data/api.provider.dart';
import 'package:urlshorty/data/repositories/gotiny.repository.dart';

class AppDependencies {
  static IGoTinyRepository goTinyRepositoryInstance() {
    final provider = ApiProvider('gotiny.cc');
    return GoTinyRepository(provider);
  }

  const AppDependencies._();
}
