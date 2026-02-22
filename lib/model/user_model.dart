class UserModel {
  final String id;
  final String email;
  final String? area;
  final String? name;
  final String? profilePic;
  final String? mobile;

  UserModel({
    required this.id,
    required this.email,
    this.area,
    this.name,
    this.profilePic,
    this.mobile,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      area: map['area'],
      name: map['name'],
      profilePic: map['profilePic'],
      mobile: map['mobile'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'area': area,
      'name': name,
      'profilePic': profilePic,
      'mobile': mobile,
    };
  }
}
