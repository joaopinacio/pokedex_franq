import 'dart:developer' as developer;

void logger(String value, {StackTrace? stackTrace}) {
  developer.log(value, name: 'LOG');
}
