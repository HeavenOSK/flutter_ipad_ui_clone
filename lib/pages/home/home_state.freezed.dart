// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call({AppIconState? draggingAppIconState}) {
    return _HomeState(
      draggingAppIconState: draggingAppIconState,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  AppIconState? get draggingAppIconState;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call({AppIconState? draggingAppIconState});

  $AppIconStateCopyWith<$Res>? get draggingAppIconState;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? draggingAppIconState = freezed,
  }) {
    return _then(_value.copyWith(
      draggingAppIconState: draggingAppIconState == freezed
          ? _value.draggingAppIconState
          : draggingAppIconState as AppIconState?,
    ));
  }

  @override
  $AppIconStateCopyWith<$Res>? get draggingAppIconState {
    if (_value.draggingAppIconState == null) {
      return null;
    }

    return $AppIconStateCopyWith<$Res>(_value.draggingAppIconState!, (value) {
      return _then(_value.copyWith(draggingAppIconState: value));
    });
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call({AppIconState? draggingAppIconState});

  @override
  $AppIconStateCopyWith<$Res>? get draggingAppIconState;
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? draggingAppIconState = freezed,
  }) {
    return _then(_HomeState(
      draggingAppIconState: draggingAppIconState == freezed
          ? _value.draggingAppIconState
          : draggingAppIconState as AppIconState?,
    ));
  }
}

/// @nodoc
class _$_HomeState implements _HomeState {
  const _$_HomeState({this.draggingAppIconState});

  @override
  final AppIconState? draggingAppIconState;

  @override
  String toString() {
    return 'HomeState(draggingAppIconState: $draggingAppIconState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.draggingAppIconState, draggingAppIconState) ||
                const DeepCollectionEquality()
                    .equals(other.draggingAppIconState, draggingAppIconState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(draggingAppIconState);

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({AppIconState? draggingAppIconState}) = _$_HomeState;

  @override
  AppIconState? get draggingAppIconState;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith;
}
