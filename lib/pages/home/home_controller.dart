import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ipad_ui/pages/home/app_icon/app_icon_state.dart';
import 'package:ipad_ui/pages/home/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(const HomeState());

  void startDragging({
    required int index,
    required Offset localPosition,
    required Offset globalPosition,
  }) {
    final currentIconState = state.draggingAppIconState;
    if (currentIconState != null) {
      return;
    }

    state = state.copyWith(
      draggingAppIconState: AppIconState(
        index: index,
        localPosition: localPosition,
        startPosition: globalPosition,
        currentPosition: globalPosition,
      ),
    );
  }

  void updateDragging({
    required int index,
    required Offset localPosition,
    required Offset globalPosition,
  }) {
    final currentIconState = state.draggingAppIconState;
    if (currentIconState == null) {
      state = state.copyWith(
        draggingAppIconState: AppIconState(
          index: index,
          localPosition: localPosition,
          startPosition: globalPosition,
          currentPosition: globalPosition,
        ),
      );
    } else {
      state = state.copyWith(
        draggingAppIconState: currentIconState.copyWith(
          currentPosition: globalPosition,
        ),
      );
    }
  }

  void finishDragging() {
    state = state.copyWith(
      draggingAppIconState: null,
    );
  }
}
