import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_config.dart';
import 'package:flutter_app/config/routes.dart';
import 'package:flutter_app/data/app_state.dart';
import 'package:flutter_app/ui/collection/collection_view_model.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CollectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CollectionViewModel>(
      distinct: true,
      converter: (store) => CollectionViewModel.fromStore(context, store),
      builder: (_, viewModel) => CollectionPageContent(viewModel),
    );
  }
}

class CollectionPageContent extends StatefulWidget {
  CollectionPageContent(this.viewModel);

  final CollectionViewModel viewModel;

  @override
  CollectionPageContentState createState() {
    return CollectionPageContentState();
  }
}

class CollectionPageContentState extends State<CollectionPageContent>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = StepTween(
      begin: 100,
      end: 140,
    ).animate(_controller);
    _controller.forward(from: 0).whenComplete(
          () => _controller.reverse(from: 5),
        );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppConfig config = AppConfig.of(context);
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: Icon(
                Icons.arrow_forward,
              ),
              style: ElevatedButton.styleFrom(
                primary: ElTiempoColors.primaryColor,
                shadowColor: ElTiempoColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    50.0,
                  ),
                ),
              ),
              onPressed: () {
                config.router.navigateTo(
                  context,
                  '${Routes.collectionPage}',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
