import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:urlshorty/app.router.dart';
import 'package:urlshorty/blocs/gotiny/gotiny.cubit.dart';
import 'package:urlshorty/ui/themes/color.theme.dart';
import 'package:urlshorty/utils/extensions/context.ext.dart';

class InitialContainerWidget extends StatelessWidget {
  final TextEditingController inputController;
  final GoTinyCubit goTinyCubit;

  const InitialContainerWidget({
    Key? key,
    required this.inputController,
    required this.goTinyCubit,
  }) : super(key: key);

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
              if (inputController.text.isNotEmpty) {
                goTinyCubit.shortenURL(inputController.text);
              } else {
                context.displaySnackbar('Cannot shorten empty URL!');
              }
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
