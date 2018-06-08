import 'package:redux_boilerplate/data/firestore_client.dart';
import 'package:redux_boilerplate/data/preferences_client.dart';

class AppRepository {
  final FireStoreClient fireStoreClient;
  final PreferencesClient preferencesClient;

  AppRepository({
    this.fireStoreClient,
    this.preferencesClient,
  });
}
