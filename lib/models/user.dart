class UserModel {
  final int id;
  final String loginType;
  final String userName;
  final String avatarUrl;
  final bool isVip;
  final bool isStaff;

  UserModel(
      {required this.id,
      required this.loginType,
      required this.userName,
      required this.avatarUrl,
      required this.isVip,
      required this.isStaff});
}
