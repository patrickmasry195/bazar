part of 'validation_cubit.dart';

class ValidationState extends Equatable {
  const ValidationState({
    this.formType = AuthFormType.signIn,
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.name = const NameValidator.pure(),
    this.phone = const PhoneValidator.pure(),
    this.confirmPassword = const ConfirmPasswordValidator.pure(),
    this.confirmPasswordInteracted = false,
    this.isValid = false,
    this.nameInteracted = false,
    this.emailInteracted = false,
    this.passwordInteracted = false,
    this.phoneInteracted = false,
    this.showPassword = false,
  });

  final AuthFormType formType;
  final EmailValidator email;
  final PasswordValidator password;
  final NameValidator name;
  final PhoneValidator phone;
  final ConfirmPasswordValidator confirmPassword;
  final bool isValid;
  final bool nameInteracted;
  final bool emailInteracted;
  final bool passwordInteracted;
  final bool confirmPasswordInteracted;
  final bool phoneInteracted;
  final bool showPassword;

  @override
  List<Object?> get props => [
    formType,
    email,
    password,
    name,
    phone,
    confirmPassword,
    isValid,
    nameInteracted,
    emailInteracted,
    passwordInteracted,
    phoneInteracted,
    showPassword,
  ];

  ValidationState copyWith({
    AuthFormType? formType,
    EmailValidator? email,
    PasswordValidator? password,
    NameValidator? name,
    PhoneValidator? phone,
    ConfirmPasswordValidator? confirmPassword,
    bool? isValid,
    bool? nameInteracted,
    bool? emailInteracted,
    bool? passwordInteracted,
    bool? confirmPasswordInteracted,
    bool? phoneInteracted,
    bool? showPassword,
  }) {
    return ValidationState(
      formType: formType ?? this.formType,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isValid: isValid ?? this.isValid,
      nameInteracted: nameInteracted ?? this.nameInteracted,
      emailInteracted: emailInteracted ?? this.emailInteracted,
      passwordInteracted: passwordInteracted ?? this.passwordInteracted,
      confirmPasswordInteracted:
          confirmPasswordInteracted ?? this.confirmPasswordInteracted,
      phoneInteracted: phoneInteracted ?? this.phoneInteracted,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
