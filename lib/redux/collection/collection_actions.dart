import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/item.dart';

class RequestCollectionAction {}

class SuccessCollectionAction {}

class GetCollectionAction {
  GetCollectionAction({
    @required this.context,
  });

  final BuildContext context;
}

class ReceivedCollectionAction {
  ReceivedCollectionAction({
    @required this.items,
  });

  final List<Item> items;
}
