import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/app_state.dart';
import 'package:flutter_app/data/loading_status.dart';
import 'package:flutter_app/redux/collection/collection_actions.dart';
import 'package:flutter_app/ui/collection/collection_view_model.dart';
import 'package:flutter_app/utils/images.dart';
import 'package:flutter_redux/flutter_redux.dart';

class NasaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CollectionViewModel>(
      distinct: true,
      converter: (store) => CollectionViewModel.fromStore(context, store),
      builder: (_, viewModel) => NasaPageContent(viewModel),
      onInit: (store) => {
        store.dispatch(
          GetCollectionAction(
            context: context,
          ),
        ),
      },
    );
  }
}

class NasaPageContent extends StatefulWidget {
  NasaPageContent(this.viewModel);

  final CollectionViewModel viewModel;

  @override
  NasaPageContentState createState() {
    return NasaPageContentState();
  }
}

class NasaPageContentState extends State<NasaPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.viewModel.status == LoadingStatus.success
          ? Center(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.viewModel.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Row(
                            children: [
                              FadeInImage.assetNetwork(
                                placeholder: ImagesAssets.placeHolder,
                                image:
                                    widget.viewModel.items[index].image ?? "",
                                fit: BoxFit.contain,
                                height: 100.0,
                                width: 100.0,
                                placeholderCacheHeight: 150,
                                imageCacheHeight: 150,
                              ),
                              Expanded(
                                child: Text(
                                  widget.viewModel.items[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
