import 'package:flutter/material.dart';
import 'package:ipad_ui/components/dock.dart';

class DocLayer extends StatelessWidget {
  const DocLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 24,
        ),
        child: Dock(),
      ),
    );
  }
}
