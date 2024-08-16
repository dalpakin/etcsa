import 'report_model.dart';

class ProcedureReportModel extends ReportModel {
  int? procedureID;
  String? procedureText;
  int? isObserved;
  int? isAssisted;
  int? isPerformed;
  int? isSimulated;
  String? setting;

  ProcedureReportModel({
    required super.ID,
    super.studentID,
    super.courseID,
    super.specialtyID,
    super.attendingPhysicianID,
    this.procedureID,
    this.procedureText,
    this.isObserved,
    this.isAssisted,
    this.isPerformed,
    this.isSimulated,
    this.setting,
    super.saveEpoch,
    super.sentEpoch,
    super.isSent,
    super.isApproved,
    super.comment,
    super.localStorageID,
  });
}
