import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipad_ui/pages/home/app_icon/app_icon.dart';

part 'app_icon_state.freezed.dart';

extension AppIconStateX on AppIconState {
  Offset get difference => currentPosition - startPosition;

  bool get shouldZoom {
    return difference.dy < -AppIcon.size * 0.5;
  }

  Offset get leftTopEdgePosition => currentPosition - localPosition;
}

@freezed
abstract class AppIconState with _$AppIconState {
  const factory AppIconState({
    required int index,
    required Offset startPosition,
    required Offset currentPosition,
    required Offset localPosition,
  }) = _AppIconState;
}
