// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiOptions _$MultiOptionsFromJson(Map<String, dynamic> json) {
  return MultiOptions(
    id: json['id'] as int,
    name: json['name'] as String,
    value: json['value'] as String,
    isSelected: json['isSelected'] as bool,
  );
}

Map<String, dynamic> _$MultiOptionsToJson(MultiOptions instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'isSelected': instance.isSelected,
    };
