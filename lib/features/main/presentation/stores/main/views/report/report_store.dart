import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/main/data/mappers/report_mapper.dart';
import 'package:trzapp/features/main/domain/entities/report.dart';
import 'package:trzapp/features/main/domain/usecases/report/get_infecteds.dart';
import 'package:trzapp/features/main/domain/usecases/report/get_non_infecteds.dart';

part 'report_store.g.dart';

class ReportStore = _ReportStoreBase with _$ReportStore;

abstract class _ReportStoreBase with Store {
  final IGetInfected _infected = serviceLocator<IGetInfected>();
  final IGetNonInfected _nonInfected = serviceLocator<IGetNonInfected>();

  @observable
  String percentInfected;

  @observable
  String percentNonInfected;

  @action
  getInfected() async {
    Response response = await _infected.getInfected();
    if (response.statusCode == 200) {
      Report report = ReportMapper.fromJson(response.data["report"]);
      var percent = report.average * 100;
      percentInfected = percent.toStringAsFixed(0);
      return;
    }
    return;
  }

  @action
  getNonInfected() async {
    Response response = await _nonInfected.getNonInfected();
    if (response.statusCode == 200) {
      Report report = ReportMapper.fromJson(response.data["report"]);
      var percent = report.average * 100;
      percentNonInfected = percent.toStringAsFixed(0);
      return;
    }
    return;
  }
}
