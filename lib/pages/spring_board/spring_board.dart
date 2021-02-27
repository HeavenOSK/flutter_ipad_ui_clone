import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ipad_ui/pages/spring_board/app_collection_layer.dart';
import 'package:ipad_ui/pages/spring_board/dock_layer.dart';

class SpringBoard extends HookWidget {
  const SpringBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue.withOpacity(0.3),
        child: Stack(
          children: const [
            Positioned.fill(
              child: AppCollectionLayer(),
            ),
            Positioned.fill(
              child: DocLayer(),
            ),
          ],
        ),
      ),
    );
  }
}
