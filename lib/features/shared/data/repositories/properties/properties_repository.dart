import 'package:dio/dio.dart';
import 'package:trzapp/features/shared/data/datasource/remote/properties/properties_datasource.dart';
import 'package:trzapp/features/shared/domain/i_repositories/properties/i_properties_repository.dart';

class PropertiesRepository implements IPropertiesRepository {
  final IPropertiesDatasource _datasource;
  PropertiesRepository(this._datasource);

  @override
  Future<Response> getItemsUser(String id) async {
    return await _datasource.getItemsUser(id);
  }
}
