import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(
      failedValue: input,
      max: maxLength,
    ));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else if (input.isEmpty || input == '') {
    return left(ValueFailure.empty(failedValue: input));
  }
  {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateTodaysDate(String input) {
  DateTime startOfToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final inputDate = DateTime.tryParse(input);

  if (inputDate!.isBefore(startOfToday)) {
    return left(
        ValueFailure.invalidDate(failedValue: inputDate.toIso8601String()));
  } else if (inputDate.isAfter(DateTime.now())) {
    return left(
        ValueFailure.invalidDate(failedValue: inputDate.toIso8601String()));
  }
  {
    return right(input);
  }
}
