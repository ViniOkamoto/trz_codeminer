import 'package:dio/dio.dart';
import 'package:trzapp/features/main/domain/i_repositories/report/i_report_repository.dart';

abstract class IGetInfected {
  Future<Response> getInfected();
}

class GetInfected implements IGetInfected {
  final IReportRepository _repository;
  GetInfected(this._repository);
  @override
  Future<Response> getInfected() async {
    return await _repository.getInfected();
  }
}
