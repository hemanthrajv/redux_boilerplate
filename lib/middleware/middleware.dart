import 'package:redux_boilerplate/data/app_repository.dart';
import 'package:redux_boilerplate/models/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleware(AppRepository repository) => <Middleware<AppState>>[];
