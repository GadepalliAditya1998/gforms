part of 'form_state.dart';

class _FormFieldControlConfigurationStateModel {
  List<FormFieldConfiguration> _formFieldsConfigurations;

  _FormFieldControlConfigurationStateModel(this._formFieldsConfigurations);

  void addFormControl(FormFieldConfiguration formFieldConfiguration) {
    this._formFieldsConfigurations.add(formFieldConfiguration);
  }

  void deleteFormControl(int id) {
    this._formFieldsConfigurations.removeWhere((element) => element.id == id);
  }

  void cloneFormControl(int uid, int id) {
    var formElement = this._formFieldsConfigurations.firstWhere((element) => element.id == id, orElse: () => null);
    if (formElement != null) {
      formElement.id = uid;
      this._formFieldsConfigurations.add(formElement);
    }
  }
}
