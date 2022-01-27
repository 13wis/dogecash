import 'package:formz/formz.dart';
import 'package:frontend/models/enums.dart';

class FirstName extends FormzInput<String?, LengthValidationError> {
  const FirstName.pure() : super.pure(null);
  const FirstName.dirty(String? value) : super.dirty(value);

  @override
  LengthValidationError? validator(String? value) {
    return value == null || value.isEmpty ? LengthValidationError.length : null;
  }
}
