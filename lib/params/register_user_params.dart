class RegisterUserParam {
  String username;
  String email;
  bool isActive;
  bool isWaitress;
  String firstName;
  String lastName;
  String password1;
  String password2;

  RegisterUserParam(
    this.username,
    this.email,
    this.isActive,
    this.isWaitress,
    this.firstName,
    this.lastName,
    this.password1,
    this.password2,
  );

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'is_active': isActive,
      'is_waitress': isWaitress,
      'first_name': firstName,
      'last_name': lastName,
      'password1': password1,
      'password2': password2,
    };
  }
}
