import 'package:flutter/material.dart';
import 'package:urlshorty/ui/themes/color.theme.dart';

class LoadingContainerWidget extends StatelessWidget {
  const LoadingContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: CircularProgressIndicator(
        color: ColorTheme.colorProduct,
      ),
    );
  }
}
