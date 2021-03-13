import 'package:gforms/models/config/field_configuration.dart';
import 'package:gforms/models/config/form_theme_configuration.dart';

class FormConfiguration {
  int id;
  String name;
  String description;
  String headerImageUrl;
  bool isExpired;
  DateTime expiredAt;
  bool canAccessible;
  List<FormFieldConfiguration> fieldsConfiguration;
  bool isAlreadySubmitted;
  DateTime submittedOn;
  FormThemeConfiguration formThemeConfiguration;
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
  });
}
