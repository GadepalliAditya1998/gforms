import 'package:gforms/models/config/multi_options.dart';
import 'package:gforms/models/state_models/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'field_configuration.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true)
class FormFieldConfiguration {
  int id;
  String fieldName;
  String description;
  @JsonKey(fromJson: convertIntToEnum, toJson: convertEnumToInt)
  FormFieldType fieldType;
  List<MultiOptions> options;
  int position;
  bool isRequired;
  String fieldResponse;
  DateTime responsedAt;

  FormFieldConfiguration({
    this.id,
    this.fieldName,
    this.description,
    this.fieldType,
    this.options,
    this.position,
    this.isRequired,
    this.fieldResponse,
    this.responsedAt,
  }) {
    this.options = this.options ?? [];
  }

  FormFieldConfiguration copyWith({
    int id,
    String fieldName,
    String description,
    FormFieldType fieldType,
    List<MultiOptions> options,
    int position,
    bool isRequired,
    String fieldResponse,
    DateTime responsedAt,
  }) {
    return FormFieldConfiguration(
      id: id ?? this.id,
      fieldName: fieldName ?? this.fieldName,
      description: description ?? this.description,
      fieldType: fieldType ?? this.fieldType,
      options: options ?? this.options,
      position: position ?? this.position,
      isRequired: isRequired ?? this.isRequired,
      fieldResponse: fieldResponse ?? this.fieldResponse,
      responsedAt: responsedAt ?? this.responsedAt,
    );
  }

  factory FormFieldConfiguration.fromJson(Map<String, dynamic> json) => _$FormFieldConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$FormFieldConfigurationToJson(this);

  static int convertEnumToInt(FormFieldType formFieldType) {
    return FormFieldType.values.indexOf(formFieldType);
  }

  static FormFieldType convertIntToEnum(int formFieldType) {
    return FormFieldType.values[formFieldType];
  }
}
