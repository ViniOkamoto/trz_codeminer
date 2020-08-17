import 'package:get_it/get_it.dart';
import 'package:trzapp/features/start/presentation/stores/fable/fable_store.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerLazySingleton<FableStore>(() => FableStore());
}
