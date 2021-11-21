import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:urlshorty/app.router.dart';
import 'package:urlshorty/ui/themes/color.theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

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
              // TODO: navigate to history screen
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: Center(
          child: _InitialContainer(
            inputController: _inputController,
          ),
        ),
      ),
    );
  }
}

class _InitialContainer extends StatelessWidget {
  final TextEditingController inputController;

  const _InitialContainer({Key? key, required this.inputController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Shorten your long URL by pasting it below, or simply scan the QR code',
          style: Typography.englishLike2018.headline6,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48.0),
        TextField(
          controller: inputController,
          decoration: const InputDecoration(
            hintText: 'Paste your URL...',
            filled: true,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorTheme.colorProduct,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: ColorTheme.colorProduct,
            child: const Text(
              'SHORTEN',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // TODO: make API request
            },
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: ColorTheme.colorProductSecondary,
            child: const Text(
              'SCAN QR CODE',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              dynamic result = await AppRouter.navigateToQRViewScreen(context);
              final barcode = result as Barcode?;
              if (barcode != null) {
                inputController.text = barcode.code ?? '';
              }
            },
          ),
        ),
      ],
    );
  }
}
