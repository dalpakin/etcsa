class ProcedureModel {
  int id;
  String description;
  int? relatedReport; // Nullable

  ProcedureModel({
    required this.id,
    required this.description,
    this.relatedReport,
  });
}
