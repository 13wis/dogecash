import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';
import 'package:frontend/models/enums.dart';

class Email extends FormzInput<String?, EmailValidationError> {
  const Email.pure() : super.pure(null);
  const Email.dirty(String? value) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    if (!EmailValidator.validate(value ?? '')) {
      return EmailValidationError.invalid;
    }
  }
}
