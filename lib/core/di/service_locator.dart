import 'package:get_it/get_it.dart';
import 'package:trzapp/features/create_account/data/datasource/people_datasource.dart';
import 'package:trzapp/features/create_account/data/repositories/people_repository.dart';
import 'package:trzapp/features/create_account/domain/i_repositories/i_people_repository.dart';
import 'package:trzapp/features/create_account/domain/usecases/register_account.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/create_account_store.dart';
import 'package:trzapp/features/shared/data/datasource/cache/user_cache.dart';
import 'package:trzapp/features/shared/data/repositories/user_repository.dart';
import 'package:trzapp/features/shared/domain/i_repositories/i_user_repository.dart';
import 'package:trzapp/features/shared/domain/usecases/user_auth.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';
import 'package:trzapp/features/start/presentation/stores/fable/fable_store.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  //Datasource
  serviceLocator
      .registerLazySingleton<IPeopleDatasource>(() => PeopleDatasource());
  serviceLocator.registerLazySingleton<IUserCache>(() => UserCache());

  //Repositories
  serviceLocator.registerLazySingleton<IPeopleRepository>(
      () => PeopleRepository(serviceLocator<IPeopleDatasource>()));
  serviceLocator.registerLazySingleton<IUserRepository>(
      () => UserRepository(serviceLocator<IUserCache>()));

  //Usecases
  serviceLocator.registerLazySingleton<IRegisterAccount>(
      () => RegisterAccount(serviceLocator<IPeopleRepository>()));
  serviceLocator
      .registerLazySingleton<IUserAuth>(() => UserAuth(serviceLocator()));
  //Stores
  serviceLocator.registerLazySingleton<UserStore>(() => UserStore());
  serviceLocator.registerLazySingleton<FableStore>(() => FableStore());
  serviceLocator
      .registerLazySingleton<CreateAccountStore>(() => CreateAccountStore());
}
