import 'package:dio/dio.dart';
import 'package:trzapp/features/main/domain/i_repositories/report/i_report_repository.dart';

abstract class IGetNonInfected {
  Future<Response> getNonInfected();
}

class GetNonInfected implements IGetNonInfected {
  final IReportRepository _repository;
  GetNonInfected(this._repository);
  @override
  Future<Response> getNonInfected() async {
    return await _repository.getNonInfected();
  }
}
