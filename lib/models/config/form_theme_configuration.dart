import 'package:gforms/styles/app_theme.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form_theme_configuration.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true)
class FormThemeConfiguration {
  int themeId;
  String backgroundColor;
  String themeColor;
  bool isBackgroundImageTheme;
  String backgroundImageUrl;

  FormThemeConfiguration({
    this.themeId,
    this.backgroundColor,
    this.themeColor,
    this.isBackgroundImageTheme,
    this.backgroundImageUrl,
  });

  FormThemeConfiguration.init() {
    this.themeId = null;
    this.themeColor = AppTheme.themeColors.first.value.toString();
    this.backgroundColor = AppTheme.backgroundColors.first.value.toString();
    this.isBackgroundImageTheme = false;
  }

  factory FormThemeConfiguration.fromJson(Map<String, dynamic> json) => _$FormThemeConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$FormThemeConfigurationToJson(this);
}
