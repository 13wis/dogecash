import 'package:formz/formz.dart';
import 'package:frontend/models/enums.dart';

class Search extends FormzInput<String?, LengthValidationError> {
  const Search.pure() : super.pure(null);
  const Search.dirty(String? value) : super.dirty(value);

  @override
  LengthValidationError? validator(String? value) {
    return value == null || value.isEmpty ? LengthValidationError.length : null;
  }
}
