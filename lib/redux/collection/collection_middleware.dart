import 'dart:async';

import 'package:flutter_app/data/app_state.dart';
import 'package:flutter_app/data/networking/api.dart';
import 'package:flutter_app/redux/collection/collection_actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter_app/redux/collection/collection_services.dart';

class CollectionMiddleware extends MiddlewareClass<AppState> {
  CollectionMiddleware(Api api) {
    this.api = api;
    this.collectionServices = new CollectionServices(api);
  }

  Api api;
  CollectionServices collectionServices;

  @override
  Future<Null> call(
      Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is GetCollectionAction) {
      await getCollection(next, action, store);
    }
  }

  Future<Null> getCollection(
    NextDispatcher next,
    GetCollectionAction action,
    Store<AppState> store,
  ) async {
    next(RequestCollectionAction());
    try {
      var response = await collectionServices.getCollection(action.context);
      if (response != null) {
        next(
          ReceivedCollectionAction(
            items: response.data,
          ),
        );
      }
      next(SuccessCollectionAction());
    } catch (e) {
      next(SuccessCollectionAction());
      print(e);
    }
  }
}
