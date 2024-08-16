class ReportModel {
  int ID;
  int? studentID;
  int? courseID;
  int? specialtyID;
  int? attendingPhysicianID;
  int? saveEpoch;
  int? sentEpoch;
  int? isSent;
  int? isApproved;
  String? comment;
  int? localStorageID;

  ReportModel({
    required this.ID,
    this.studentID,
    this.courseID,
    this.specialtyID,
    this.attendingPhysicianID,
    this.saveEpoch,
    this.sentEpoch,
    this.isSent,
    this.isApproved,
    this.comment,
    this.localStorageID,
  });
}
