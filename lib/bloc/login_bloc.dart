import 'dart:async';

import 'package:first_project/bloc/validator_bloc.dart';

class Bloc extends Validator {
final StreamController<String> _emailStreamController = StreamController<String>();
  final StreamController<String> _passwordStreamController = StreamController<String>();

// Add data to stream
  Function(String) get emailSink => _emailStreamController.sink.add;
  Function(String) get passwordSink => _passwordStreamController.sink.add;

  // Get data from streams
  Stream<String> get emailStream =>
      _emailStreamController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordStreamController.stream.transform(validatePassword);


  dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
  }
}

final bloc = Bloc();
