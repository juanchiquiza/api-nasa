import 'package:flutter_app/data/loading_status.dart';
import 'package:flutter_app/redux/collection/collection_actions.dart';
import 'package:flutter_app/redux/collection/collection_state.dart';
import 'package:redux/redux.dart';

Reducer<CollectionState> collectionReducer = combineReducers([
  TypedReducer<CollectionState, RequestCollectionAction>(_requestCollection),
  TypedReducer<CollectionState, SuccessCollectionAction>(_successCollection),
  TypedReducer<CollectionState, ReceivedCollectionAction>(_receivedCollection),
]);

CollectionState _requestCollection(
  CollectionState collectionState,
  RequestCollectionAction action,
) {
  return collectionState.copyWith(
    loadingStatus: LoadingStatus.loading,
  );
}

CollectionState _successCollection(
  CollectionState collectionState,
    SuccessCollectionAction action,
) {
  return collectionState.copyWith(
    loadingStatus: LoadingStatus.success,
  );
}

CollectionState _receivedCollection(
  CollectionState collectionState,
  ReceivedCollectionAction action,
) {
  return collectionState.copyWith(
    items: action.items,
  );
}
