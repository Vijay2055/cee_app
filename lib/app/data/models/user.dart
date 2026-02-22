class UserModel {
  final String name;
  final String uuid;
  final String? email;
  final String mobile;

  UserModel({
    required this.name,
    required this.uuid,
    this.email,
    required this.mobile,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uuid: map['uid'] ?? '',
      email: map['email'],
      mobile: map['mobile'] ?? '',
    );
  }
}
