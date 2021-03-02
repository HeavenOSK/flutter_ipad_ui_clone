import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ipad_ui/app_open_container/app_open_container.dart';
import 'package:ipad_ui/apps/example_app.dart';
import 'package:ipad_ui/components/animated_app_icon.dart';

class Dock extends StatelessWidget {
  const Dock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          height: 108,
          width: 560,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 1),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppOpenContainer(
                      iconSize: AnimatedAppIcon.areaSize,
                      childBuilder: (_, openApp) {
                        return AnimatedAppIcon(
                          onTap: openApp,
                        );
                      },
                      appBuilder: (c) {
                        return const ExampleApp();
                      },
                    ),
                    AppOpenContainer(
                      iconSize: AnimatedAppIcon.areaSize,
                      childBuilder: (_, openApp) {
                        return AnimatedAppIcon(
                          onTap: openApp,
                        );
                      },
                      appBuilder: (c) {
                        return const ExampleApp();
                      },
                    ),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  color: Colors.grey.withOpacity(0.25),
                  width: 2,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppOpenContainer(
                      iconSize: AnimatedAppIcon.areaSize,
                      childBuilder: (_, openApp) {
                        return AnimatedAppIcon(
                          onTap: openApp,
                        );
                      },
                      appBuilder: (c) {
                        return const ExampleApp();
                      },
                    ),
                    AppOpenContainer(
                      iconSize: AnimatedAppIcon.areaSize,
                      childBuilder: (_, openApp) {
                        return AnimatedAppIcon(
                          onTap: openApp,
                        );
                      },
                      appBuilder: (c) {
                        return const ExampleApp();
                      },
                    ),
                    AppOpenContainer(
                      iconSize: AnimatedAppIcon.areaSize,
                      childBuilder: (_, openApp) {
                        return AnimatedAppIcon(
                          onTap: openApp,
                        );
                      },
                      appBuilder: (c) {
                        return const ExampleApp();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
