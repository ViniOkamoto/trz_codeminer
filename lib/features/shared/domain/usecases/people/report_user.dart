import 'package:dio/dio.dart';
import 'package:trzapp/features/shared/domain/i_repositories/people/i_people_repository.dart';

abstract class IReportUser {
  Future<Response> reportUser(String id, String infected);
}

class ReportUser implements IReportUser {
  final IPeopleRepository _repository;
  ReportUser(this._repository);

  @override
  Future<Response> reportUser(String id, String infected) async {
    return await _repository.reportUser(id, infected);
  }
}
