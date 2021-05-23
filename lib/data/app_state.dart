import 'package:equatable/equatable.dart';
import 'package:flutter_app/redux/collection/collection_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState extends Equatable {
  AppState({
    @required this.collectionState,
  });

  final CollectionState collectionState;

  static AppState rehydrationJSON(dynamic json) {
    return json != null
        ? AppState(
      collectionState: CollectionState.initial(),
    )
        : AppState.initial();
  }

  Map<String, dynamic> toJson() => {};

  factory AppState.initial() {
    return AppState(
      collectionState: CollectionState.initial(),
    );
  }

  AppState copyWith({
    CollectionState collectionState,
  }) {
    return AppState(
      collectionState: collectionState ?? this.collectionState,
    );
  }

  @override
  String toString() {
    return 'AppState{collectionState: $collectionState}';
  }

  @override
  List<Object> get props => [
    collectionState,
  ];
}
