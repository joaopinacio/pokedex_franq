import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_franq/app/core/utils/app_extensions.dart';

void main() {
  group('Extensions', () {
    late String text;

    void init([String value = '']) {
      text = value;
    }

    test('Capitalize Normal', () {
      init('teste');
      text = text.capitalize;
      expect(text, 'Teste');
    });

    test('Capitalize with space', () {
      init('t e s t e');
      text = text.capitalize;
      expect(text, 'T e s t e');
    });

    test('Capitalize Empty', () {
      init();
      text = text.capitalize;
      expect(text, '');
    });

    test('PutLeft 2 zeros', () {
      init('1');
      text = text.putLeft;
      expect(text, '001');
    });

    test('PutLeft 1 zero', () {
      init('21');
      text = text.putLeft;
      expect(text, '021');
    });

    test('PutLeft no zeros', () {
      init('321');
      text = text.putLeft;
      expect(text, '321');
    });

    test('PutLeft Empty', () {
      init('');
      text = text.putLeft;
      expect(text, '000');
    });
  });
}
