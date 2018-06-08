library app_state;

import 'package:built_value/built_value.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([AppStateBuilder updates(AppStateBuilder builder)]) = _$AppState;

  AppState._();

  static AppState initState() {
    return new AppState((AppStateBuilder b) {});
  }
}
