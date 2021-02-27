import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipad_ui/pages/home/app_icon/app_icon_state.dart';

part 'home_state.freezed.dart';

extension HomeStateX on HomeState {
  bool dragging(int index) => draggingAppIconState?.index == index;
}

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    AppIconState? draggingAppIconState,
  }) = _HomeState;
}
