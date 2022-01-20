class UserRegister {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? gender;
  UserRegister() {
    name?.trim();
    email?.trim();
    password?.trim();
    phone?.trim();
    gender?.trim();
  }
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};
    map["name"] = name;
    map["email"] = email;
    map["phone"] = phone;
    map["gender"] = gender;
    return map;
  }
}
