import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ipad_ui/pages/home/app_icon/app_icon_state.dart';
import 'package:ipad_ui/pages/home/home_controller.dart';
import 'package:ipad_ui/pages/home/navigation_layer/navigation_layer.dart';

import 'dock.dart';

class IPadUIHome extends StatefulWidget {
  const IPadUIHome({Key? key}) : super(key: key);

  static final controller = StateNotifierProvider(
    (_) => HomeController(),
  );

  @override
  _IPadUIHomeState createState() => _IPadUIHomeState();
}

class _IPadUIHomeState extends State<IPadUIHome>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Consumer(
            builder: (context, watch, child) {
              final state = watch(IPadUIHome.controller.state);
              final shouldZoom =
                  state.draggingAppIconState?.shouldZoom ?? false;
              return Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  height: deviceSize.height * (shouldZoom ? 0.98 : 1),
                  width: deviceSize.width * (shouldZoom ? 0.98 : 1),
                  child: child,
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Scaffold(
                body: Center(
                  child: Text(
                    'iPad UI',
                    style: theme.textTheme.headline4,
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Dock(),
          ),
          const Positioned.fill(
            child: NavigationLayer(),
          ),
        ],
      ),
    );
  }
}
