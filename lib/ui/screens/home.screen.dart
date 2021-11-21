import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshorty/app.router.dart';
import 'package:urlshorty/blocs/gotiny/gotiny.cubit.dart';
import 'package:urlshorty/blocs/gotiny/gotiny.state.dart';
import 'package:urlshorty/blocs/status.enum.dart';
import 'package:urlshorty/ui/widgets/home/data_container.widget.dart';
import 'package:urlshorty/ui/widgets/home/error_container.widget.dart';
import 'package:urlshorty/ui/widgets/home/initial_container.widget.dart';
import 'package:urlshorty/ui/widgets/home/loading_container.widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  final GoTinyCubit goTinyCubit;

  const HomeScreen({
    Key? key,
    required this.goTinyCubit,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Shorty'),
        actions: [
          IconButton(
            onPressed: () {
              AppRouter.navigateToHistoryScreen(context);
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocBuilder<GoTinyCubit, GoTinyState>(
            builder: (BuildContext context, GoTinyState state) {
              switch (state.status) {
                case StateStatus.initial:
                  return InitialContainerWidget(
                    inputController: _inputController,
                    goTinyCubit: widget.goTinyCubit,
                  );
                case StateStatus.loading:
                  return const LoadingContainerWidget();
                case StateStatus.successful:
                  return state.data != null
                      ? DataContainerWidget(
                          data: state.data!,
                        )
                      : const ErrorContainerWidget(
                          errorMessage: 'No data',
                        );
                case StateStatus.failed:
                  return ErrorContainerWidget(
                    errorMessage: state.errorMessage ?? 'Unknown exception',
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
