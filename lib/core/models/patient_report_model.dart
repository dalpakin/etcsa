import 'report_model.dart';

class PatientReportModel extends ReportModel {
  int? patientHospitalID;
  int? isObserved;
  int? isAssisted;
  int? isPerformed;
  int? isSimulated;
  int? isHistory;
  int? isTreatment;
  int? isPhysicalExamination;
  int? isDifferentialDiagnosis;
  String? setting;
  String? illnessScript;
  int? tier1ID;
  String? tier1;
  int? tier2ID;
  String? tier2;
  int? tier3ID;
  String? tier3;
  int? tier4ID;
  String? tier4;

  PatientReportModel({
    required super.ID,
    super.studentID,
    super.courseID,
    super.specialtyID,
    super.attendingPhysicianID,
    this.patientHospitalID,
    this.isObserved,
    this.isAssisted,
    this.isPerformed,
    this.isSimulated,
    this.isHistory,
    this.isTreatment,
    this.isPhysicalExamination,
    this.isDifferentialDiagnosis,
    this.setting,
    this.illnessScript,
    this.tier1ID,
    this.tier1,
    this.tier2ID,
    this.tier2,
    this.tier3ID,
    this.tier3,
    this.tier4ID,
    this.tier4,
    super.saveEpoch,
    super.sentEpoch,
    super.isSent,
    super.isApproved,
    super.comment,
    super.localStorageID,
  });
}
