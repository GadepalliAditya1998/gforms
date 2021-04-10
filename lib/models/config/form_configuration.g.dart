// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormConfiguration _$FormConfigurationFromJson(Map<String, dynamic> json) {
  return FormConfiguration(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    headerImageUrl: json['headerImageUrl'] as String,
    isExpired: json['isExpired'] as bool,
    expiredAt: json['expiredAt'] == null ? null : DateTime.parse(json['expiredAt'] as String),
    canAccessible: json['canAccessible'] as bool,
    fieldsConfiguration: (json['fieldsConfiguration'] as List)?.map((e) => e == null ? null : FormFieldConfiguration.fromJson(e as Map<String, dynamic>))?.toList() ?? [],
    isAlreadySubmitted: json['isAlreadySubmitted'] as bool,
    submittedOn: json['submittedOn'] == null ? null : DateTime.parse(json['submittedOn'] as String),
    formThemeConfiguration: json['formThemeConfiguration'] == null ? null : FormThemeConfiguration.fromJson(json['formThemeConfiguration'] as Map<String, dynamic>),
    isConfigMode: json['isConfigMode'] as bool ?? false,
  );
}

Map<String, dynamic> _$FormConfigurationToJson(FormConfiguration instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'headerImageUrl': instance.headerImageUrl,
      'isExpired': instance.isExpired,
      'expiredAt': instance.expiredAt?.toIso8601String(),
      'canAccessible': instance.canAccessible,
      'fieldsConfiguration': instance.fieldsConfiguration?.map((e) => e?.toJson())?.toList(),
      'isAlreadySubmitted': instance.isAlreadySubmitted,
      'submittedOn': instance.submittedOn?.toIso8601String(),
      'formThemeConfiguration': instance.formThemeConfiguration?.toJson(),
      'isConfigMode': instance.isConfigMode,
    };
