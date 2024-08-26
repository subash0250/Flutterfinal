class UserModel {

  String username;
  String email;
  String password;
  String phoneNumber;
  String address;
  String gender;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.address,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'address': address,
      'gender': gender,
    };
  }
}
