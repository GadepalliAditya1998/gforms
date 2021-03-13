import 'package:flutter/widgets.dart';
import 'package:gforms/extensions/color_extensions.dart';
import 'package:gforms/models/state_models/form_state.dart';

class SettingsStateModel extends ChangeNotifier {
  bool _isColorPaletteInFocus = false;
  FormStateModel _formStateModel;

  SettingsStateModel(this._formStateModel);

  void setColorPaletteFocus(bool focus) {
    this._isColorPaletteInFocus = focus;
    notifyListeners();
  }

  void toggleColorPaletteFocus() {
    this.setColorPaletteFocus(!this._isColorPaletteInFocus);
  }

  void setFormBackgroundColor(Color color) {
    notifyListeners();
  }

  void setThemeColor(Color color) {
    this._formStateModel.setFormThemeColor(color);
    notifyListeners();
  }

  void setBackgroundColor(Color color) {
    this._formStateModel.setFormBackgroundColor(color);
    notifyListeners();
  }

  bool get isColorPaletteInFocus => _isColorPaletteInFocus;

  Color get formBackgroundColor => ColorExtensions.fromString(this._formStateModel.formThemeConfiguration.backgroundColor);

  Color get themeColor => ColorExtensions.fromString(this._formStateModel.formThemeConfiguration.themeColor);

  bool isCurrentColor(Color color) {
    return this.formBackgroundColor == color;
  }
}
