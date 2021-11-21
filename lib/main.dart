import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:urlshorty/app.dependencies.dart';
import 'package:urlshorty/blocs/gotiny/gotiny.cubit.dart';
import 'package:urlshorty/blocs/history/history.cubit.dart';
import 'package:urlshorty/data/cache.provider.dart';
import 'package:urlshorty/data/models/url_history.model.dart';
import 'package:urlshorty/data/repositories/gotiny.repository.dart';
import 'package:urlshorty/data/repositories/history.repository.dart';
import 'package:urlshorty/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter<URLHistoryModel>(URLHistoryModelAdapter());
  await Hive.openBox<URLHistoryModel>(CacheProvider.historyBox);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IGoTinyRepository>.value(
          value: AppDependencies.goTinyRepositoryInstance(),
        ),
        RepositoryProvider<IHistoryRepository>.value(
          value: AppDependencies.historyRepositoryInstance(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GoTinyCubit>(
            create: (BuildContext context) => GoTinyCubit(
              context.read<IGoTinyRepository>(),
              context.read<IHistoryRepository>(),
            ),
          ),
          BlocProvider<HistoryCubit>(
            create: (BuildContext context) => HistoryCubit(
              context.read<IHistoryRepository>(),
            ),
          ),
        ],
        child: const App(),
      ),
    ),
  );
}
