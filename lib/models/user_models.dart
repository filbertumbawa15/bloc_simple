class UserModel {
  String? username;
  String? email;
  bool? isActive;
  bool? isWaitress;
  String? firstName;
  String? lastName;
  String? password1;
  String? password2;

  UserModel(
    {
    required this.username,
    required this.email,
    required this.isActive,
    required this.isWaitress,
    required this.firstName,
    required this.lastName,
    required this.password1,
    required this.password2,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    isActive = json['is_active'];
    isWaitress = json['is_waitress'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    password1 = json['password1'];
    password2 = json['password2'];
    
  }
}
