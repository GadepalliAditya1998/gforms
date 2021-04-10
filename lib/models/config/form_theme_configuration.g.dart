// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_theme_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormThemeConfiguration _$FormThemeConfigurationFromJson(Map<String, dynamic> json) {
  return FormThemeConfiguration(
    themeId: json['themeId'] as int,
    backgroundColor: json['backgroundColor'] as String,
    themeColor: json['themeColor'] as String,
    isBackgroundImageTheme: json['isBackgroundImageTheme'] as bool,
    backgroundImageUrl: json['backgroundImageUrl'] as String,
  );
}

Map<String, dynamic> _$FormThemeConfigurationToJson(FormThemeConfiguration instance) => <String, dynamic>{
      'themeId': instance.themeId,
      'backgroundColor': instance.backgroundColor,
      'themeColor': instance.themeColor,
      'isBackgroundImageTheme': instance.isBackgroundImageTheme,
      'backgroundImageUrl': instance.backgroundImageUrl,
    };
