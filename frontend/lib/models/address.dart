import 'package:formz/formz.dart';
import 'package:frontend/models/enums.dart';

class Address extends FormzInput<String?, LengthValidationError> {
  const Address.pure() : super.pure(null);
  const Address.dirty(String? value) : super.dirty(value);

  @override
  LengthValidationError? validator(String? value) {
    return value == null || value.isEmpty ? LengthValidationError.length : null;
  }
}
