import 'dart:convert';
import 'dart:io';

import 'package:fluro/fluro.dart' as _fluroRouter;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app_config.dart';
import 'package:flutter_app/config/quqo_endpoints.dart';
import 'package:flutter_app/data/app_state.dart';
import 'package:flutter_app/data/networking/api.dart';
import 'package:flutter_app/redux/app/store.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'config/routes.dart';

Future<Map> getSettings() async {
  String baseJsonStr = await rootBundle.loadString('lib/settings.json');
  Map<String, dynamic> settings = json.decode(baseJsonStr);
  return settings;
}

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  var api = Api();
  var persistor = createPersistor("ElTiempo");

  Store<AppState> store = await createStore(api: api, persistor: persistor);

  final router = _fluroRouter.FluroRouter();
  Routes.configureRoutes(router);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  var configuredApp;
  configuredApp = AppConfig(
    persistor: persistor,
    endpoints: ElTiempoEndpoints.initial(),
    router: router,
    navigatorKey: navigatorKey,
    child: MyApp(store),
  );
  runApp(configuredApp);
}

class FlutterMain {}

class MyApp extends StatefulWidget {
  MyApp(this.store);

  final Store<AppState> store;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<LocalizationsDelegate> delegates = [];
  String error;

  @override
  void initState() {
    super.initState();

    delegates = [
      DefaultCupertinoLocalizations.delegate,
      FallbackCupertinoLocalisationsDelegate(),
    ];
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    AppConfig config = AppConfig.of(context);

    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(

        // statusBarColor is used to set Status bar color in Android devices.
        statusBarColor: Colors.transparent,

        // To make Status bar icons color white in Android devices.
        statusBarIconBrightness: Brightness.light,

        // statusBarBrightness is used to set Status bar icon color in iOS.
        statusBarBrightness: Brightness.light
        // Here light means dark color Status bar icons.

        ));

    return StoreProvider<AppState>(
      key: ValueKey('quqo_aplication'),
      store: widget.store,
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        debugShowCheckedModeBanner: kDebugMode,
        onGenerateTitle: (BuildContext context) =>
            "El tiempo",
        localizationsDelegates: delegates,
        supportedLocales: [
          const Locale('es', ''),
        ],
        title: "El tiempo",
        theme: ThemeData(
          primaryColor: ElTiempoColors.primaryColor,
          accentColor: ElTiempoColors.primaryColor,
          // cursorColor: QuqoColors.primaryColor,
          dividerColor: ElTiempoColors.darkColor,
          brightness: Brightness.light,
          scaffoldBackgroundColor: ElTiempoColors.backgroundColor,
          hintColor: ElTiempoColors.darkColor,
        ),
        navigatorKey: config.navigatorKey,
        onGenerateRoute: config.router.generator,
      ),
    );
  }
}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
