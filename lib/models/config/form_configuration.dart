import 'package:gforms/models/config/field_configuration.dart';
import 'package:gforms/models/config/form_theme_configuration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form_configuration.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true)
class FormConfiguration {
  int id;
  String name;
  String description;
  String headerImageUrl;
  bool isExpired;
  DateTime expiredAt;
  bool canAccessible;
  @JsonKey(defaultValue: [])
  List<FormFieldConfiguration> fieldsConfiguration;
  bool isAlreadySubmitted;
  DateTime submittedOn;
  FormThemeConfiguration formThemeConfiguration;
  @JsonKey(defaultValue: false)
  bool isConfigMode;

  FormConfiguration({
    this.id,
    this.name,
    this.description,
    this.headerImageUrl,
    this.isExpired,
    this.expiredAt,
    this.canAccessible,
    this.fieldsConfiguration,
    this.isAlreadySubmitted,
    this.submittedOn,
    this.formThemeConfiguration,
    this.isConfigMode,
  }) {
    this.fieldsConfiguration = this.fieldsConfiguration ?? [];
    this.formThemeConfiguration = this.formThemeConfiguration ?? FormThemeConfiguration();
  }

  FormConfiguration.init() {
    this.id = 0;
    this.name = "Untitled Form";
    this.fieldsConfiguration = [];
    this.formThemeConfiguration = FormThemeConfiguration.init();
    this.isConfigMode = true;
  }

  factory FormConfiguration.fromJson(Map<String, dynamic> json) => _$FormConfigurationFromJson(json);
  Map<String, dynamic> toJson() {
    var res = _$FormConfigurationToJson(this);
    return res;
  }
}
