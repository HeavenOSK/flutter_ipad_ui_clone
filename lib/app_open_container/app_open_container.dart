import 'package:flutter/material.dart';
import 'package:ipad_ui/apps/example_app.dart';

typedef AppOpenContainerChildBuilder = Widget Function(
  BuildContext context,
  VoidCallback openApp,
);

class AppOpenContainer extends StatefulWidget {
  const AppOpenContainer({
    required this.childBuilder,
    required this.appBuilder,
    required this.iconSize,
    Key? key,
  }) : super(key: key);

  final AppOpenContainerChildBuilder childBuilder;
  final WidgetBuilder appBuilder;
  final double iconSize;

  @override
  _AppOpenContainerState createState() => _AppOpenContainerState();
}

class _AppOpenContainerState extends State<AppOpenContainer> {
  final _childKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Builder(
      key: _childKey,
      builder: (context) {
        return widget.childBuilder(
          context,
          () {
            Navigator.of(context).push<void>(
              _AppOpenContainerRoute(
                childKey: _childKey,
                childBuilder: widget.childBuilder,
                appBuilder: (_) {
                  return const ExampleApp();
                },
              ),
            );
          },
        );
      },
    );
  }
}

class _AppOpenContainerRoute<T> extends ModalRoute<T> {
  _AppOpenContainerRoute({
    required this.appBuilder,
    required this.childKey,
    required this.childBuilder,
  });

  final WidgetBuilder appBuilder;
  final GlobalKey childKey;
  final AppOpenContainerChildBuilder childBuilder;

  @override
  bool get maintainState => true;

  @override
  Color? get barrierColor => null;

  @override
  bool get opaque => true;

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 250);

  RenderBox? _navigator(BuildContext context) {
    return Navigator.of(context).context.findRenderObject() as RenderBox?;
  }

  Rect _iconRect(GlobalKey key, RenderBox rootRenderBox) {
    final render = key.currentContext!.findRenderObject() as RenderBox?;
    return MatrixUtils.transformRect(
      render!.getTransformTo(rootRenderBox),
      Offset.zero & render.size,
    );
  }

  static double get opacityThreshold => 0.3;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final navigator = _navigator(context);
    final appIconRect = _iconRect(
      childKey,
      navigator!,
    );
    final pageRect = Offset.zero & navigator.size;
    final offsetTween = Tween<Offset>(
      begin: appIconRect.topLeft,
      end: pageRect.topLeft,
    );
    final sizeTween = Tween<Size>(
      begin: appIconRect.size,
      end: pageRect.size,
    );
    final borderRadiusTween = Tween<BorderRadius>(
      begin: BorderRadius.circular(14),
      end: BorderRadius.zero,
    );
    return Align(
      alignment: Alignment.topLeft,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          Curve _preferredCurve() {
            switch (animation.status) {
              case AnimationStatus.dismissed:
              case AnimationStatus.completed:
              case AnimationStatus.forward:
                return Curves.easeOut;
              case AnimationStatus.reverse:
                return ElasticInCurve(0.95);
            }
          }

          final curve = CurvedAnimation(
            parent: animation,
            curve: _preferredCurve(),
          );
          final offset = offsetTween.transform(curve.value);
          final size = sizeTween.transform(curve.value.abs());
          final borderRadius = borderRadiusTween.transform(curve.value.abs());
          return Stack(
            children: [
              Positioned(
                top: offset.dy,
                left: offset.dx,
                child: IgnorePointer(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 50),
                    opacity: animation.value <= opacityThreshold ? 1 : 0,
                    child: ClipRRect(
                      borderRadius: borderRadius,
                      child: SizedBox.fromSize(
                        size: size,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topLeft,
                          child: SizedBox.fromSize(
                            size: sizeTween.end,
                            child: Builder(
                              builder: (ctx) {
                                return childBuilder(ctx, () {});
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: offset.dy,
                left: offset.dx,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 50),
                  opacity: animation.value >= opacityThreshold ? 1 : 0,
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    child: SizedBox.fromSize(
                      size: size,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topLeft,
                        child: SizedBox.fromSize(
                          size: sizeTween.end,
                          child: Builder(
                            builder: appBuilder,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
