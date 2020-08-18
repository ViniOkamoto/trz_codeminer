import 'package:get_it/get_it.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/create_account_store.dart';
import 'package:trzapp/features/start/presentation/stores/fable/fable_store.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  ///Stores
  serviceLocator.registerLazySingleton<FableStore>(() => FableStore());
  serviceLocator
      .registerLazySingleton<CreateAccountStore>(() => CreateAccountStore());
}
