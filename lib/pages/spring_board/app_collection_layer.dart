import 'package:flutter/material.dart';
import 'package:ipad_ui/app_open_container/app_open_container.dart';
import 'package:ipad_ui/apps/example_app.dart';
import 'package:ipad_ui/components/animated_app_icon.dart';

class AppCollectionLayer extends StatelessWidget {
  const AppCollectionLayer({Key? key}) : super(key: key);

  static const double topPadding = 102;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: topPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < 6; i++)
            Column(
              children: [
                AppOpenContainer(
                  iconSize: AnimatedAppIcon.areaSize,
                  childBuilder: (_, openApp) {
                    return AnimatedAppIcon(
                      onTap: () {
                        openApp();
                      },
                    );
                  },
                  appBuilder: (c) {
                    return const ExampleApp();
                  },
                ),
                const SizedBox(height: 4),
                const Text(
                  'example',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
