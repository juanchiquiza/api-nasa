import 'package:fluro/fluro.dart' as _fluroRouter;
import 'package:flutter/material.dart';

import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String collectionPage = "/collection";

  static _fluroRouter.TransitionType transitionTypePage =
      _fluroRouter.TransitionType.cupertino;

  static void configureRoutes(_fluroRouter.FluroRouter router) {
    router.notFoundHandler = _fluroRouter.Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        debugPrint("ROUTE WAS NOT FOUND !!!");
        return Container();
      },
    );

    router.define(
      root,
      handler: collectionPageHandler,
      transitionType: transitionTypePage,
    );
    router.define(
      collectionPage,
      handler: nasaPageHandler,
      transitionType: transitionTypePage,
    );
  }
}
