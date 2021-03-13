import 'package:gforms/models/config/field_configuration.dart';
import 'package:gforms/models/config/form_configuration.dart';
import 'package:gforms/models/state_models/enums.dart';

class MockData {
  static FormConfiguration get mockFormConfig {
    return FormConfiguration(
      fieldsConfiguration: [
        FormFieldConfiguration(
          fieldName: 'Name',
          fieldType: FormFieldType.shortAnswer,
        ),
      ],
      isConfigMode: true,
    );
  }
}
