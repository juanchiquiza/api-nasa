import 'dart:async';
import 'package:flutter_app/data/app_state.dart';
import 'package:flutter_app/data/networking/api.dart';
import 'package:flutter_app/redux/app/app_reducer.dart';
import 'package:flutter_app/redux/collection/collection_middleware.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

Persistor<AppState> createPersistor(String key) => Persistor<AppState>(
    storage: FlutterStorage(key: key),
    serializer: JsonSerializer<AppState>(AppState.rehydrationJSON));

Future<Store<AppState>> createStore(
    {Api api, Persistor<AppState> persistor}) async {

  var initialState;
  try {
    initialState = await persistor.load();
  } catch (e) {}

  Store<AppState> store = Store(
    appReducer,
    initialState: initialState ?? AppState.initial(),
    middleware: [
      CollectionMiddleware(api),
      persistor.createMiddleware(),
    ],
    distinct: true,
  );
  api.loadStore(store);
  return store;
}
