import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/data/app_state.dart';
import 'package:flutter_app/data/loading_status.dart';
import 'package:flutter_app/data/models/item.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class CollectionViewModel extends Equatable {
  CollectionViewModel({
    @required this.status,
    @required this.items,
  });

  final LoadingStatus status;
  final List<Item> items;

  static CollectionViewModel fromStore(
      BuildContext context, Store<AppState> store) {
    return CollectionViewModel(
      status: store.state.collectionState.loadingStatus,
      items: store.state.collectionState.items,
    );
  }

  @override
  List<Object> get props => [
        status,
        items,
      ];
}
