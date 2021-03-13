import 'package:gforms/models/state_models/enums.dart';

class FormFieldConfiguration {
  int id;
  String fieldName;
  String description;
  FormFieldType fieldType;
  int position;
  bool isRequired;
  String fieldResponse;
  DateTime responsedAt;

  FormFieldConfiguration({
    this.id,
    this.fieldName,
    this.description,
    this.fieldType,
    this.position,
    this.isRequired,
    this.fieldResponse,
    this.responsedAt,
  });
}
