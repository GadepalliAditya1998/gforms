import 'package:json_annotation/json_annotation.dart';

part 'multi_options.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true)
class MultiOptions {
  int id;
  String name;
  String value;
  bool isSelected;

  MultiOptions({
    this.id,
    this.name,
    this.value,
    this.isSelected,
  });

  factory MultiOptions.fromJson(Map<String, dynamic> json) => _$MultiOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$MultiOptionsToJson(this);
}
