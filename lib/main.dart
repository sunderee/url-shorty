import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshorty/app.dependencies.dart';
import 'package:urlshorty/blocs/gotiny/gotiny.cubit.dart';
import 'package:urlshorty/data/repositories/gotiny.repository.dart';
import 'package:urlshorty/ui/app.dart';

void main() {
  runApp(
    RepositoryProvider<IGoTinyRepository>.value(
      value: AppDependencies.goTinyRepositoryInstance(),
      child: BlocProvider<GoTinyCubit>(
        create: (BuildContext context) => GoTinyCubit(
          context.read<IGoTinyRepository>(),
        ),
        child: const App(),
      ),
    ),
  );
}
