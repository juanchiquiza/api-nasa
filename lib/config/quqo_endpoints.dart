import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ElTiempoEndpoints {
  ElTiempoEndpoints({
    @required this.baseUrl,
    @required this.search,
  });

  final String baseUrl;
  final String search;

  factory ElTiempoEndpoints.initial() => ElTiempoEndpoints(
        baseUrl: 'images-api.nasa.gov',
        search: "/search",
      );
}
