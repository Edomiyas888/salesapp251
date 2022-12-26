import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
class ConfirmationBox extends StatefulWidget {
  const ConfirmationBox({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ConfirmationBox> createState() => _ConfirmationBoxState();
}

class _ConfirmationBoxState extends State<ConfirmationBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Confirm Dialog'),
          onPressed: () async {
            if (await confirm(
              context,
              title: const Text('Confirm'),
              content: const Text('Did you made the sale?'),
              textOK: const Text('Yes'),
              textCancel: const Text('No'),
            )) {
              return print('pressedOK');
            }
            return print('pressedCancel');
          },
        ),
      ),
    );
  }
}