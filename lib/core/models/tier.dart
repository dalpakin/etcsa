class TierModel {
  int id;
  String description;
  int? relatedReport; // Nullable

  TierModel(this.id, this.description, this.relatedReport);
}
