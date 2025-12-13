import 'package:flutter_test/flutter_test.dart';
import 'package:hng_auth_sdk/src/exceptions/auth_exceptions.dart';

void main() {
  group('Weak Password Exception Tests', () {
    test('should create WeakPasswordException with default message', () {
      // Act
      final exception = WeakPasswordException();

      // Assert
      expect(
        exception.message,
        'Password is too weak. Use at least 6 characters',
      );
      expect(exception.code, 'weak-password');
      expect(exception.canBypass, isFalse);
    });

    test('should create WeakPasswordException with custom message', () {
      // Act
      final exception = WeakPasswordException('Custom weak password message');

      // Assert
      expect(exception.message, 'Custom weak password message');
      expect(exception.code, 'weak-password');
      expect(exception.canBypass, isFalse);
    });

    test('should create WeakPasswordException with bypass option', () {
      // Act
      final exception = WeakPasswordException('Custom message', true);

      // Assert
      expect(exception.message, 'Custom message');
      expect(exception.code, 'weak-password');
      expect(exception.canBypass, isTrue);
    });

    test(
      'should create WeakPasswordException with custom message and bypass',
      () {
        // Act
        final exception = WeakPasswordException(
          'Your password is weak but you can continue',
          true,
        );

        // Assert
        expect(exception.message, 'Your password is weak but you can continue');
        expect(exception.code, 'weak-password');
        expect(exception.canBypass, isTrue);
      },
    );

    test('should return correct string representation', () {
      // Act
      final exception = WeakPasswordException('Test message');

      // Assert
      expect(exception.toString(), 'Test message');
    });
  });
}
