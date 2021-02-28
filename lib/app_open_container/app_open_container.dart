import 'package:flutter/material.dart';
import 'package:ipad_ui/apps/example_app.dart';

typedef AppOpenContainerChildBuilder = Widget Function(
  BuildContext context,
  VoidCallback openApp,
);

class AppOpenContainer extends StatelessWidget {
  const AppOpenContainer({
    required this.childBuilder,
    required this.appBuilder,
    Key? key,
  }) : super(key: key);

  final AppOpenContainerChildBuilder childBuilder;
  final WidgetBuilder appBuilder;

  @override
  Widget build(BuildContext context) {
    return childBuilder(
      context,
      () {
        Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (_) {
              return ExampleApp();
            },
          ),
        );
      },
    );
  }
}
