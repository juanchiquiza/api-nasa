import 'package:flutter/widgets.dart';
import 'package:flutter_app/app_config.dart';
import 'package:flutter_app/data/app_constants.dart';
import 'package:flutter_app/data/models/item.dart';
import 'package:flutter_app/data/networking/api.dart';

class CollectionServices {
  CollectionServices(this.quqoApi);

  Api quqoApi;

  Future<MyHttpResponse> getCollection(BuildContext context) async {
    AppConfig config = AppConfig.of(context);
    var url = Uri.https(
      config.endpoints.baseUrl,
      config.endpoints.search,
      {
        "q": "apollo 11",
      },
    );
    print(url);
    MyHttpResponse responseService =
        await quqoApi.serviceRequest(url, context, QuqoRequest.GET);
    print(responseService);
    List<Item> items = [];

    if (responseService.statusCode == 200) {
      responseService.data[AppConstants.collectionKey][AppConstants.itemsKey]
          ?.forEach((item) {
        items.add(Item.fromJson(item ?? {}));
      });
      responseService.data = items;
    } else {
      responseService.data = null;
    }
    return responseService;
  }
}
