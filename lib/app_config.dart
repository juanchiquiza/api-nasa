import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/quqo_endpoints.dart';
import 'package:redux_persist/redux_persist.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required this.persistor,
    @required this.endpoints,
    @required this.router,
    @required this.navigatorKey,
    @required Widget child,
  }) : super(child: child);

  final Persistor<dynamic> persistor;
  final ElTiempoEndpoints endpoints;
  final FluroRouter router;
  final GlobalKey<NavigatorState> navigatorKey;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
