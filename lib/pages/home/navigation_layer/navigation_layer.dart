import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ipad_ui/pages/home/app_icon/app_icon.dart';
import 'package:ipad_ui/pages/home/app_icon/app_icon_state.dart';
import 'package:ipad_ui/pages/home/home.dart';

class NavigationLayer extends HookWidget {
  const NavigationLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shouldZoom = useProvider(
      IPadUIHome.controller.state.select(
        (value) => value.draggingAppIconState?.shouldZoom ?? false,
      ),
    );
    final iconState = useProvider(
      IPadUIHome.controller.state.select(
        (value) => value.draggingAppIconState,
      ),
    );
    if (iconState == null) {
      return const SizedBox.shrink();
    }
    final virtualLayerSize = Size(
      AppIcon.size * 2.25,
      AppIcon.size * 5,
    );
    final double paddingRate = 8;
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            left: iconState.leftTopEdgePosition.dx -
                (virtualLayerSize.width - AppIcon.size) / 2,
            top: iconState.leftTopEdgePosition.dy -
                (virtualLayerSize.height - AppIcon.size) / 2,
            child: AnimatedContainer(
              height: shouldZoom ? virtualLayerSize.height : AppIcon.size,
              width: shouldZoom ? virtualLayerSize.width : AppIcon.size,
              margin: shouldZoom
                  ? EdgeInsets.zero
                  : EdgeInsets.only(
                      left: (virtualLayerSize.width - AppIcon.size) / 2,
                      top: (virtualLayerSize.height - AppIcon.size) / 2,
                    ),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ],
              ),
              duration: const Duration(milliseconds: 200),
            ),
          ),
          Positioned(
            left: iconState.leftTopEdgePosition.dx -
                (shouldZoom ? paddingRate : 0),
            top: iconState.leftTopEdgePosition.dy -
                (shouldZoom ? paddingRate : 0),
            child: Padding(
              padding:
                  shouldZoom ? EdgeInsets.all(paddingRate) : EdgeInsets.zero,
              child: FittedBox(
                child: AppIcon(
                  index: iconState.index,
                  key: ValueKey(iconState.index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
