class UserModel {
  String? username;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  bool? tc;

  UserModel({
    this.username,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.email,
    this.tc,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'] ?? {}; // Handle nested 'token' object
    return UserModel(
      firstName: user['first_name'] ?? '',
      lastName: user['last_name'] ?? '',
      username: user['username'] ?? '',
      mobileNumber: user['mobile_number'] ?? '',
      email: user['email'] ?? '',
      tc: user['tc'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile_number'] =mobileNumber;
    data['email'] = email;
    data['tc'] = tc;
    return data;
  }
}
