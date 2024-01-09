import 'dart:async';

class Validator {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) => {
            if (email.contains("@") && email.contains(".com"))
              {sink.add(email)}
            else
              sink.addError("Enter a valid email")
          });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) => {
            if (password.length > 5)
              {sink.add(password)}
            else
              sink.addError("Password must be atleast of 5 characters")
          });
}
