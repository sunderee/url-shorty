import 'package:flutter/material.dart';
import 'package:urlshorty/ui/themes/color.theme.dart';

class ErrorContainerWidget extends StatelessWidget {
  final String errorMessage;

  const ErrorContainerWidget({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.warning, color: ColorTheme.colorProduct),
        const SizedBox(height: 12.0),
        Text(
          errorMessage,
          style: Typography.englishLike2018.overline,
        ),
      ],
    );
  }
}
