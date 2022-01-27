import 'package:formz/formz.dart';
import 'package:frontend/models/enums.dart';

class Dogetag extends FormzInput<String?, LengthValidationError> {
  const Dogetag.pure() : super.pure(null);
  const Dogetag.dirty(String? value) : super.dirty(value);

  @override
  LengthValidationError? validator(String? value) {
    return value == null || value.length < 4
        ? LengthValidationError.length
        : null;
  }
}
