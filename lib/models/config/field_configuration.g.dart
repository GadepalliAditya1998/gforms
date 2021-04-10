// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormFieldConfiguration _$FormFieldConfigurationFromJson(Map<String, dynamic> json) {
  return FormFieldConfiguration(
    id: json['id'] as int,
    fieldName: json['fieldName'] as String,
    description: json['description'] as String,
    fieldType: FormFieldConfiguration.convertIntToEnum(json['fieldType'] as int),
    options: (json['options'] as List)?.map((e) => e == null ? null : MultiOptions.fromJson(e as Map<String, dynamic>))?.toList(),
    position: json['position'] as int,
    isRequired: json['isRequired'] as bool,
    fieldResponse: json['fieldResponse'] as String,
    responsedAt: json['responsedAt'] == null ? null : DateTime.parse(json['responsedAt'] as String),
  );
}

Map<String, dynamic> _$FormFieldConfigurationToJson(FormFieldConfiguration instance) => <String, dynamic>{
      'id': instance.id,
      'fieldName': instance.fieldName,
      'description': instance.description,
      'fieldType': FormFieldConfiguration.convertEnumToInt(instance.fieldType),
      'options': instance.options?.map((e) => e?.toJson())?.toList(),
      'position': instance.position,
      'isRequired': instance.isRequired,
      'fieldResponse': instance.fieldResponse,
      'responsedAt': instance.responsedAt?.toIso8601String(),
    };
