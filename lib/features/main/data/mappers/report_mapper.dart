import 'package:trzapp/features/main/domain/entities/report.dart';

class ReportMapper {
  static Report fromJson(Map<String, dynamic> json) {
    return Report(
        description: json['description'],
        average: json['average_infected'] == null
            ? json['average_healthy']
            : json['average_infected']);
  }
}
