import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Shorty'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: navigate to history screen
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Shorten your long URLs by pasting it below or scanning the QR code',
                style: Typography.englishLike2018.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
