import 'package:json_annotation/json_annotation.dart';

// part 'specialty.g.dart';
//
// @JsonSerializable()
class SpecialtyModel {
  int id;
  String description;

  SpecialtyModel(this.id, this.description);

  // factory SpecialtyModel.fromJson(Map<String, dynamic> json) => _$SpecialtyModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$SpecialtyModelToJson(this);
}
