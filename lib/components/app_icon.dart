import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum _Phase {
  waiting,
  pressing,
  longPressing,
  longPressed,
}

extension _PhaseX on _Phase {
  bool get pressing => this == _Phase.pressing;

  bool get longPressing => this == _Phase.longPressing;

  bool get longPressed => this == _Phase.longPressed;

  double get padding {
    switch (this) {
      case _Phase.longPressing:
        return 12;
      case _Phase.pressing:
      case _Phase.waiting:
        return 4;
      case _Phase.longPressed:
        return 0;
    }
  }
}

class AppIcon extends StatefulWidget {
  const AppIcon({
    this.onTap,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  static double areaSize = 72;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  _AppIconState createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> with SingleTickerProviderStateMixin {
  _Phase _phase = _Phase.waiting;

  static const Duration _animationDuration = Duration(milliseconds: 200);

  Future<void> _sleepForAnimation() async {
    await Future<void>.delayed(_animationDuration);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        await _sleepForAnimation();
        widget.onLongPress?.call();
      },
      onTapUp: (_) {
        if (_phase.pressing) {
          widget.onTap?.call();
        }
        setState(() {
          _phase = _Phase.waiting;
        });
      },
      onTapCancel: () {
        setState(() {
          _phase = _Phase.waiting;
        });
      },
      child: SizedBox(
        height: AppIcon.areaSize,
        width: AppIcon.areaSize,
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
    );
  }
}
