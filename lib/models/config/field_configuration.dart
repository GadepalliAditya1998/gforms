import 'package:gforms/models/config/multi_options.dart';
import 'package:gforms/models/state_models/enums.dart';

class FormFieldConfiguration {
  int id;
  String fieldName;
  String description;
  FormFieldType fieldType;
  List<MultiOptions> options;
  int position;
  bool isRequired;
  String fieldResponse;
  DateTime responsedAt;

  FormFieldConfiguration({
    this.id,
    this.fieldName,
    this.description,
    this.fieldType,
    this.options,
    this.position,
    this.isRequired,
    this.fieldResponse,
    this.responsedAt,
  }) {
    this.options = this.options ?? [];
  }

  FormFieldConfiguration copyWith({
    int id,
    String fieldName,
    String description,
    FormFieldType fieldType,
    List<MultiOptions> options,
    int position,
    bool isRequired,
    String fieldResponse,
    DateTime responsedAt,
  }) {
    return FormFieldConfiguration(
      id: id ?? this.id,
      fieldName: fieldName ?? this.fieldName,
      description: description ?? this.description,
      fieldType: fieldType ?? this.fieldType,
      options: options ?? this.options,
      position: position ?? this.position,
      isRequired: isRequired ?? this.isRequired,
      fieldResponse: fieldResponse ?? this.fieldResponse,
      responsedAt: responsedAt ?? this.responsedAt,
    );
  }
}
