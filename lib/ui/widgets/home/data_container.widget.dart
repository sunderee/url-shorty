import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urlshorty/data/models/gotiny_response.model.dart';
import 'package:urlshorty/ui/themes/color.theme.dart';
import 'package:urlshorty/utils/extensions/context.ext.dart';

class DataContainerWidget extends StatefulWidget {
  final GoTinyResponseModel data;

  const DataContainerWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<DataContainerWidget> createState() => _DataContainerWidgetState();
}

class _DataContainerWidgetState extends State<DataContainerWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.data.shortURL;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _controller,
          readOnly: true,
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
              'COPY TO CLIPBOARD',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Clipboard.setData(
                ClipboardData(text: widget.data.shortURL),
              );
              context.displaySnackbar('URL copied to clipboard');
            },
          ),
        ),
      ],
    );
  }
}
