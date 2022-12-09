import 'package:flutter/material.dart';

class DividerWithMargins extends StatelessWidget {
  const DividerWithMargins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 40.0,
        ),
        Divider(),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
