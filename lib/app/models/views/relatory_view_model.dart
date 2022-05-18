import 'package:avatende/app/models/views/appraiser_data_view_model.dart';

class RelatoryViewModel {
  late String userId;
  late double mediaScores = 0.0;
  late int totalAvaliations;
  late String rangePeriod;
  bool isSelected;
  AppraiserDataViewModel? appraiserData;
  late String? userName;
  late String? departmentName;

  RelatoryViewModel(
      {required this.userId,
      required this.mediaScores,
      required this.totalAvaliations,
      this.departmentName,
      this.appraiserData,
      this.userName,
      this.isSelected = false});

  String getPerformanceLevel() {
    if (mediaScores >= 0 && mediaScores < 1) {
      return 'NÃO AVALIADO';
    } else if (mediaScores >= 1 && mediaScores < 2) {
      return 'PÉSSIMO';
    } else if (mediaScores >= 2 && mediaScores < 3) {
      return 'RUIM';
    } else if (mediaScores >= 3 && mediaScores < 4) {
      return 'REGULAR';
    } else if (mediaScores >= 4 && mediaScores < 5) {
      return 'BOM';
    } else {
      return 'ÓTIMO';
    }
  }
}
