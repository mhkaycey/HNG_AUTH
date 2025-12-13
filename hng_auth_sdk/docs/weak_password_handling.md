# Weak Password Handling in HNG Auth SDK

## Overview

The HNG Auth SDK provides a built-in mechanism to handle weak passwords during user signup. When a user tries to sign up with a weak password (typically less than 6 characters), Firebase Authentication rejects the request. The SDK now provides an option to bypass this restriction with user consent.

## How It Works

### 1. Weak Password Detection

When a user attempts to sign up with a weak password, Firebase returns a `weak-password` error. The SDK catches this error and converts it to a `WeakPasswordException` with a bypass option enabled.

### 2. Exception Structure

The `WeakPasswordException` class has been enhanced with:

```dart
class WeakPasswordException extends AuthException {
  final bool canBypass;  // New field to indicate if bypass is allowed

  WeakPasswordException([String? message, this.canBypass = false])
    : super(message ?? 'Password is too weak. Use at least 6 characters', 'weak-password');
}
```

### 3. User Interaction Flow

1. User enters email and weak password during signup
2. SDK detects weak password and throws `WeakPasswordException` with `canBypass = true`
3. UI shows a dialog with options:
   - **Cancel**: Abort the signup process
   - **Continue Anyway**: Proceed with the weak password

### 4. Bypass Implementation

Since Firebase doesn't actually allow bypassing weak password validation, the SDK implements a workaround:

- The original weak password is modified by appending a number and special character (`1!`)
- This modified password meets Firebase's minimum requirements
- The user can still log in with their original weak password (the SDK handles the translation internally)

## Implementation Details

### EmailPasswordProvider Changes

Two new methods were added:

1. `signUp(email, password)`: Now catches weak password errors and throws `WeakPasswordException` with bypass option
2. `signUpWithWeakPasswordBypass(email, password)`: Implements the bypass logic

### AuthService Changes

Added a new method:

- `signUpWithEmailPasswordWithBypass(email, password)`: Calls the provider's bypass method

### UI Changes

The `AuthWidget` now:

- Catches `WeakPasswordException` during signup
- Shows a confirmation dialog when bypass is available
- Allows the user to continue with the weak password if they choose

## Usage Example

```dart
try {
  await authService.signUpWithEmailPassword(email, password);
  // Success flow
} on WeakPasswordException catch (e) {
  if (e.canBypass) {
    // Show dialog to user asking if they want to continue
    // If user agrees:
    await authService.signUpWithEmailPasswordWithBypass(email, password);
  } else {
    // Show error message
  }
} catch (e) {
  // Handle other errors
}
```

## Security Considerations

1. **User Consent**: The bypass requires explicit user consent through the dialog
2. **Warning Message**: Users are clearly warned about using weak passwords
3. **Backend Validation**: It's recommended to implement additional password validation on your backend if needed

## Testing

The SDK includes tests for the weak password exception handling in `test/weak_password_test.dart`. These tests verify:

- Exception creation with default and custom messages
- Bypass option functionality
- Correct error codes and messages

## Customization

You can customize the weak password handling by:

- Modifying the exception messages in `WeakPasswordException`
- Changing the dialog UI in `AuthWidget._showWeakPasswordDialog`
- Adjusting the password modification logic in `signUpWithWeakPasswordBypass`
