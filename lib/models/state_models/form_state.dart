import 'package:flutter/widgets.dart';
import 'package:gforms/models/config/field_configuration.dart';
import 'package:gforms/models/config/form_configuration.dart';
import 'package:gforms/models/config/form_theme_configuration.dart';

part 'form_field_control.extension.dart';
part 'form_theme_control.extension.dart';

class FormStateModel extends ChangeNotifier {
  static int _uniqueId = -1;
  int activeFormElementId;
  bool _isConfigMode;
  FormConfiguration _formConfiguration;

  _FormThemeConfigurationStateModel _formThemeConfigurationStateModel;
  _FormFieldControlConfigurationStateModel _fieldControlConfigurationStateModel;

  FormStateModel({FormConfiguration config, bool isConfigMode = true}) {
    this._formConfiguration = config ?? FormConfiguration(formThemeConfiguration: FormThemeConfiguration());

    this._fieldControlConfigurationStateModel = _FormFieldControlConfigurationStateModel(this._formConfiguration.fieldsConfiguration);
    this._formThemeConfigurationStateModel = _FormThemeConfigurationStateModel(this._formConfiguration.formThemeConfiguration ?? FormThemeConfiguration());
    this._isConfigMode = isConfigMode;
  }

  void setActiveFormElement(int id) {
    this.activeFormElementId = id;
    notifyListeners();
  }

  bool isActiveFormElement(int id) {
    assert(id != null, 'Id cannot be null');
    return this.activeFormElementId == id;
  }

  void addFormControl(FormFieldConfiguration config) {
    config.id = this.uId;
    print("Add " + config.id.toString());
    this._fieldControlConfigurationStateModel.addFormControl(config);
    notifyListeners();
  }

  void cloneFormControl(int id) {
    print("Clone: " + id.toString());
    this._fieldControlConfigurationStateModel.cloneFormControl(this.uId, id);
    notifyListeners();
  }

  void deleteFormControl(int id) {
    this._fieldControlConfigurationStateModel.deleteFormControl(id);
    notifyListeners();
  }

  void setFormControlRequired(int id, bool isRequired) {
    this._fieldControlConfigurationStateModel.setFormControlRequired(id, isRequired);
    notifyListeners();
  }

  void setQuestionTitle(int id, String questionTitle) {
    this._fieldControlConfigurationStateModel.setFormControlTitle(id, questionTitle);
  }

  void setFormThemeColor(Color color) {
    this._formThemeConfigurationStateModel.setFormThemeColor('0xFF${color.value.toRadixString(16)}'); // Convert to hex
    notifyListeners();
  }

  void setFormBackgroundColor(Color color) {
    this._formThemeConfigurationStateModel.setFormBackgroundColor('0xFF${color.value.toRadixString(16)}'); // Convert to hex
    notifyListeners();
  }

  int get uId {
    _uniqueId++;
    return _uniqueId;
  }

  bool get isConfigMode => this._isConfigMode;

  List<FormFieldConfiguration> get formFieldConfiguration => this._formConfiguration.fieldsConfiguration;

  FormThemeConfiguration get formThemeConfiguration => this._formConfiguration.formThemeConfiguration;
}
