import 'package:formz/formz.dart';
import 'package:frontend/models/enums.dart';

class LastName extends FormzInput<String?, LengthValidationError> {
  const LastName.pure() : super.pure(null);
  const LastName.dirty(String? value) : super.dirty(value);

  @override
  LengthValidationError? validator(String? value) {
    return value == null || value.isEmpty ? LengthValidationError.length : null;
  }
}
