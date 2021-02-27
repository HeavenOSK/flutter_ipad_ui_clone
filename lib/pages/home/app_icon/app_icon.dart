import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ipad_ui/pages/home/home.dart';
import 'package:ipad_ui/pages/home/home_state.dart';

class AppIcon extends StatefulHookWidget {
  const AppIcon({
    required this.index,
    required Key key,
  }) : super(key: key);

  final int index;

  static double size = 68;

  @override
  _AppIconState createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {
  bool _pressing = false;

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(IPadUIHome.controller);
    final dragging = useProvider(
      IPadUIHome.controller.state.select(
        (s) => s.dragging(widget.index),
      ),
    );
    return GestureDetector(
      onPanStart: (d) async {
        setState(() {
          _pressing = true;
        });
        await Future<void>.delayed(const Duration(milliseconds: 160));
        setState(() {
          _pressing = false;
        });
        await Future<void>.delayed(const Duration(milliseconds: 160));
        controller.startDragging(
          index: widget.index,
          localPosition: d.localPosition,
          globalPosition: d.globalPosition,
        );
      },
      onPanUpdate: (d) {
        setState(() {
          _pressing = false;
        });
        controller.updateDragging(
          index: widget.index,
          localPosition: d.localPosition,
          globalPosition: d.globalPosition,
        );
      },
      onPanEnd: (d) {
        setState(() {
          _pressing = false;
        });
        controller.finishDragging();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        height: AppIcon.size * (_pressing ? 0.9 : 1),
        width: AppIcon.size * (_pressing ? 0.9 : 1),
        decoration: BoxDecoration(
          color: _pressing
              ? Colors.black.withOpacity(0.3)
              : Colors.white.withOpacity(1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: FractionallySizedBox(
            heightFactor: 0.7,
            widthFactor: 0.7,
            child: Image.asset(
              'images/ic_launcher.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
