class UserModel {
  UserModel({
    this.speciality,
    this.userType,
    this.profile,
    this.userName,
  });
  String? userType;
  String? speciality;
  String? profile;
  String? userName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userType: json["user_type"],
        speciality: json["speciality"],
        profile: json["profile"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        'user_type': userType,
        'speciality': speciality,
        'profile': profile,
        'user_name': userName,
      };
}
