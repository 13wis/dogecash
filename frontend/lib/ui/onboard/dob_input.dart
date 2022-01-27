import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants/styles.dart';

class DobInput extends StatelessWidget {
  final DateTime _dob;
  final Function(DateTime) _onDateTimeChanged;

  const DobInput(
      {required DateTime dob,
      required void Function(DateTime) onDateTimeChanged,
      Key? key})
      : _dob = dob,
        _onDateTimeChanged = onDateTimeChanged,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showDatePicker() async {
      final DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime(1901),
          firstDate: DateTime(1901),
          lastDate: DateTime(1901),
          initialEntryMode: DatePickerEntryMode.calendarOnly);
      if (date != null) _onDateTimeChanged(date);
    }

    return GestureDetector(
        onTap: _showDatePicker,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                    colors: [Colors.blue.shade500, Colors.blue.shade900])),
            padding: const EdgeInsets.all(GlobalSpacingFactor.three),
            margin: const EdgeInsets.only(bottom: GlobalSpacingFactor.one),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date of birth',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .merge(const TextStyle(fontWeight: FontWeight.bold))),
                  Text('${_dob.month}/${_dob.day}/${_dob.year}'),
                  const FaIcon(FontAwesomeIcons.calendarDay,
                      color: Colors.white, size: 18.0)
                ])));
  }
}
