import 'package:flutter_test/flutter_test.dart';

class EmailValidator {
  validate({String? email}) {
    if (email == null || email == '') {
      return "O email é obrigatório";
    }

    final emailRegex = RegExp(r'^[\w\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return "O email é inválido";
    }
  }
}

void main() {
  late EmailValidator emailValidator;

  setUp(() {
    emailValidator = EmailValidator();
  });
  group(
    'Validação de email',
    () {
      test(
        'deve retornar uma mensagem de erro caso o email seja null',
        () {
          final result = emailValidator.validate();

          expect(result, equals("O email é obrigatório"));
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o email seja vazio',
        () {
          final result = emailValidator.validate(email: '');

          expect(result, equals("O email é obrigatório"));
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o email seja inválido',
        () {
          final result = emailValidator.validate(email: 'Caio');

          expect(result, equals("O email é inválido"));
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o email seja inválido',
        () {
          final result = emailValidator.validate(email: 'Caio@gmail.com');

          expect(result, isNull);
        },
      );
    },
  );
}
