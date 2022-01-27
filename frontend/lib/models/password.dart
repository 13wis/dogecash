import 'package:formz/formz.dart';
import 'package:frontend/models/enums.dart';

class Password extends FormzInput<String?, List<PasswordValidationError>> {
  const Password.pure() : super.pure(null);
  const Password.dirty(String? value) : super.dirty(value);

  static const Map<int, String> expressions = {
    0: r'\S{8,}',
    1: r'\d+',
    2: r'\W'
  };

  @override
  List<PasswordValidationError>? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordValidationError.values;
    }

    List<PasswordValidationError> errors = [];
    expressions.forEach((key, pattern) {
      final RegExp regexp = RegExp(pattern);

      if (!regexp.hasMatch(value)) {
        errors.add(PasswordValidationError.values[key]);
      }
    });

    return errors.isEmpty ? null : errors;
  }
}
