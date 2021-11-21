import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshorty/blocs/history/history.cubit.dart';
import 'package:urlshorty/data/models/url_history.model.dart';
import 'package:urlshorty/ui/themes/color.theme.dart';

class HistoryScreen extends StatefulWidget {
  static const String routeName = '/history';

  final HistoryCubit historyCubit;

  const HistoryScreen({
    Key? key,
    required this.historyCubit,
  }) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    widget.historyCubit.requestHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: BlocBuilder<HistoryCubit, List<URLHistoryModel>>(
          builder: (BuildContext context, List<URLHistoryModel> data) {
            return data.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.folder_open,
                          color: ColorTheme.colorProduct,
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          'No history',
                          style: Typography.englishLike2018.overline,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(data[index].shortURL),
                        subtitle: Text(
                          data[index].longURL,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
