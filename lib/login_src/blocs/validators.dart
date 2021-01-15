import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('ab@gmail.com')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password == '1234') {
      sink.add(password);
    } else {
      sink.addError('Enter a valid password');
    }
  });
}
