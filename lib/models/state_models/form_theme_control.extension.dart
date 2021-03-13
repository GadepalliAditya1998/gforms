part of 'form_state.dart';

class _FormThemeConfigurationStateModel {
  FormThemeConfiguration _formThemeConfiguration;

  _FormThemeConfigurationStateModel(this._formThemeConfiguration);

  void setFormThemeColor(String themeColor) {
    this._formThemeConfiguration.themeColor = themeColor;
  }

  void setFormBackgroundColor(String backgroundColor) {
    this._formThemeConfiguration.backgroundColor = backgroundColor;
  }
}
