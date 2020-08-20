import 'package:dio/dio.dart';
import 'package:trzapp/features/shared/domain/i_repositories/properties/i_properties_repository.dart';

abstract class IGetItems {
  Future<Response> getItemsUser(String id);
}

class GetItems implements IGetItems {
  final IPropertiesRepository _repository;
  GetItems(this._repository);

  @override
  Future<Response> getItemsUser(String id) async {
    return await _repository.getItemsUser(id);
  }
}
