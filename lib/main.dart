import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redux_boilerplate/data/app_repository.dart';
import 'package:redux_boilerplate/data/firestore_client.dart';
import 'package:redux_boilerplate/data/preferences_client.dart';
import 'package:redux_boilerplate/middleware/middleware.dart';
import 'package:redux_boilerplate/models/app_state.dart';
import 'package:redux_boilerplate/reducers/reducers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux_boilerplate/views/home/home.dart';

Future<void> main() async {
  final FireStoreClient fireStoreClient = new FireStoreClient(
    client: Firestore.instance,
  );

  final PreferencesClient preferencesClient = new PreferencesClient(
    client: await SharedPreferences.getInstance(),
  );

  final AppRepository repository = new AppRepository(
    fireStoreClient: fireStoreClient,
    preferencesClient: preferencesClient,
  );

  runApp(
    new HomePage(
      repository: repository,
    ),
  );
}

class HomePage extends StatefulWidget {
  final AppRepository repository;
  final Store<AppState> store;

  HomePage({Key key, this.repository})
      : store = new Store<AppState>(
          reducer,
          initialState: AppState.initState(),
          middleware: createMiddleware(repository),
        ),
        super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = widget.store;
  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'DON',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Home(),
      ),
    );
  }
}
