import 'package:flutter_app/data/app_state.dart';
import 'package:flutter_app/redux/collection/collection_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    collectionState: collectionReducer(state.collectionState, action),
  );
}
