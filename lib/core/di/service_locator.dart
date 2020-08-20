import 'package:get_it/get_it.dart';
import 'package:trzapp/features/create_account/data/datasource/register_datasource.dart';
import 'package:trzapp/features/create_account/data/repositories/register_repository.dart';
import 'package:trzapp/features/create_account/domain/i_repositories/i_register_repository.dart';
import 'package:trzapp/features/create_account/domain/usecases/register_account.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/create_account_store.dart';
import 'package:trzapp/features/shared/data/datasource/cache/user_cache.dart';
import 'package:trzapp/features/shared/data/datasource/local/people/people_datasource.dart';
import 'package:trzapp/features/shared/data/datasource/local/properties/properties_datasource.dart';
import 'package:trzapp/features/shared/data/repositories/people/people_repository.dart';
import 'package:trzapp/features/shared/data/repositories/properties/properties_repository.dart';
import 'package:trzapp/features/shared/data/repositories/user/user_repository.dart';
import 'package:trzapp/features/shared/domain/i_repositories/people/i_people_repository.dart';
import 'package:trzapp/features/shared/domain/i_repositories/properties/i_properties_repository.dart';
import 'package:trzapp/features/shared/domain/i_repositories/user/i_user_repository.dart';
import 'package:trzapp/features/shared/domain/usecases/people/get_user_info.dart';
import 'package:trzapp/features/shared/domain/usecases/properties/get_items.dart';
import 'package:trzapp/features/shared/domain/usecases/users/user_auth.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';
import 'package:trzapp/features/start/presentation/stores/fable/fable_store.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  //Datasource
  serviceLocator
      .registerLazySingleton<IRegisterDatasource>(() => RegisterDatasource());
  serviceLocator.registerLazySingleton<IPropertiesDatasource>(
      () => PropertiesDatasource());
  serviceLocator
      .registerLazySingleton<IPeopleDatasource>(() => PeopleDatasource());
  serviceLocator.registerLazySingleton<IUserCache>(() => UserCache());

  //Repositories
  serviceLocator.registerLazySingleton<IRegisterRepository>(
      () => RegisterRepository(serviceLocator<IRegisterDatasource>()));
  serviceLocator.registerLazySingleton<IPropertiesRepository>(
      () => PropertiesRepository(serviceLocator<IPropertiesDatasource>()));
  serviceLocator.registerLazySingleton<IPeopleRepository>(
      () => PeopleRepository(serviceLocator<IPeopleDatasource>()));
  serviceLocator.registerLazySingleton<IUserRepository>(
      () => UserRepository(serviceLocator<IUserCache>()));

  //Usecases
  serviceLocator.registerLazySingleton<IRegisterAccount>(
      () => RegisterAccount(serviceLocator<IRegisterRepository>()));
  serviceLocator.registerFactory<IGetItems>(
      () => GetItems(serviceLocator<IPropertiesRepository>()));
  serviceLocator.registerFactory<IGetUserInfo>(
      () => GetUserInfo(serviceLocator<IPeopleRepository>()));
  serviceLocator.registerFactory<IUserAuth>(() => UserAuth(serviceLocator()));
  //Stores
  serviceLocator.registerLazySingleton<UserStore>(() => UserStore());
  serviceLocator.registerLazySingleton<FableStore>(() => FableStore());
  serviceLocator
      .registerLazySingleton<CreateAccountStore>(() => CreateAccountStore());
}
