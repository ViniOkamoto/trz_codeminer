import 'package:dio/dio.dart';
import 'package:trzapp/features/main/data/datasource/remote/report/report_datasource.dart';
import 'package:trzapp/features/main/domain/i_repositories/report/i_report_repository.dart';

class ReportRepository implements IReportRepository{
  final IReportDatasource _datasource;
  ReportRepository(this._datasource);
  @override
  Future<Response> getInfected() async{
   return await _datasource.getInfected();
  }

  @override
  Future<Response> getNonInfected() async {
    return await _datasource.getNonInfected();
  }
}