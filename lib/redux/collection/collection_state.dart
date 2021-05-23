import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/loading_status.dart';
import 'package:flutter_app/data/models/item.dart';
import 'package:meta/meta.dart';

@immutable
class CollectionState extends Equatable {
  CollectionState({
    this.loadingStatus,
    this.items,
  });

  final LoadingStatus loadingStatus;
  final List<Item> items;

  CollectionState copyWith({
    LoadingStatus loadingStatus,
    List<Item> items,
  }) {
    return CollectionState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      items: items ?? this.items,
    );
  }

  factory CollectionState.initial() => CollectionState(
        loadingStatus: LoadingStatus.success,
        items: [],
      );

  @override
  String toString() {
    return 'CouponsState{loadingStatus: $loadingStatus, items: $items}';
  }

  @override
  List<Object> get props => [
        loadingStatus,
        items,
      ];
}
