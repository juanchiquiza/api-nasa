import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/collection/collection_page.dart';
import 'package:flutter_app/ui/collection/nasa_page.dart';

var collectionPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return CollectionPage();
  },
  type: HandlerType.route,
);

var nasaPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return NasaPage();
  },
  type: HandlerType.route,
);