import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:ipad_ui/components/app_context_menu.dart';

enum _Phase {
  waiting,
  pressing,
  longPressing,
  longPressed,
}

extension _PhaseX on _Phase {
  bool get pressing => this == _Phase.pressing;

  bool get longPressing => this == _Phase.longPressing;

  bool get showContextMenu => this == _Phase.longPressed;

  double get padding {
    switch (this) {
      case _Phase.longPressing:
        return 12;
      case _Phase.pressing:
      case _Phase.waiting:
        return 4;
      case _Phase.longPressed:
        return 2;
    }
  }
}

class AnimatedAppIcon extends StatefulWidget {
  const AnimatedAppIcon({
    this.onTap,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  static double areaSize = 72;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  _AnimatedAppIconState createState() => _AnimatedAppIconState();
}

class _AnimatedAppIconState extends State<AnimatedAppIcon>
    with SingleTickerProviderStateMixin {
  _Phase _phase = _Phase.waiting;

  bool _showContextMenu = false;

  final _key = GlobalKey();

  static const Duration _animationDuration = Duration(milliseconds: 200);

  Future<void> _sleepForAnimation() async {
    await Future<void>.delayed(_animationDuration);
  }

  @override
  Widget build(BuildContext context) {
    return PortalEntry(
      visible: _showContextMenu,
      childAnchor: Alignment.bottomRight,
      portalAnchor: Alignment.topRight,
      closeDuration: Duration(milliseconds: 500),
      portal: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: AppContextMenu(
          onSelect: (action) {},
        ),
      ),
      child: GestureDetector(
        onTapDown: (_) async {
          setState(() {
            _phase = _Phase.pressing;
          });
          await Future<void>.delayed(const Duration(milliseconds: 350));

          if (!_phase.pressing) {
            return;
          }
          setState(() {
            _phase = _Phase.longPressing;
          });
          await _sleepForAnimation();
          if (!_phase.longPressing) {
            return;
          }

          setState(() {
            _phase = _Phase.longPressed;
          });
          // await _sleepForAnimation();
          // setState(() {
          //   _showContextMenu = true;
          // });

          widget.onLongPress?.call();
        },
        onTapUp: (_) {
          if (_phase.pressing) {
            widget.onTap?.call();
          }
          setState(() {
            _phase = _Phase.waiting;
            _showContextMenu = false;
          });
        },
        onTapCancel: () {
          setState(() {
            _phase = _Phase.waiting;
            _showContextMenu = false;
          });
        },
        child: SizedBox(
          key: _key,
          height: AnimatedAppIcon.areaSize,
          width: AnimatedAppIcon.areaSize,
          child: AnimatedPadding(
            padding: EdgeInsets.all(
              _phase.padding / 2,
            ),
            duration: _animationDuration,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: FractionallySizedBox(
                            heightFactor: 0.68,
                            widthFactor: 0.68,
                            child: Image.asset(
                              'images/ic_launcher.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      if (_phase.pressing)
                        Positioned.fill(
                          child: ColoredBox(
                            color: Colors.black.withOpacity(0.15),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
