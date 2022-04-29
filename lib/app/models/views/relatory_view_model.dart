import 'package:avatende/app/models/views/appraiser_data_view_model.dart';

class RelatoryViewModel {
  String userId;
  String userName;
  double mediaScores = 0.0;
  AppraiserDataViewModel appraiserData;
  String departmentName;
  int totalAvaliations;
  bool isSelected;
  String rangePeriod;

  RelatoryViewModel(
      {this.userId,
      this.mediaScores,
      this.appraiserData,
      this.departmentName,
      this.userName,
      this.totalAvaliations,
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
