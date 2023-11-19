class LoginResponse {
  final int sCode;
  final String sMessage;
  final List<LoginResponseData> data;

  const LoginResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class LoginResponseData {
  final UserInfo? userInfo;

  const LoginResponseData(
      {required this.userInfo});
}

class UserInfo {
  final String id;
  final String uname;
  final String password;
  final String gender;
  final String description;
  final String cader;
  final String cadername;
  final String department;
  final String createDt;
  final String modifyDt;
  final bool active;
  final int underscoreV;
  final String secure;
  final int loggTime;
  final UserCader? userCader;

  const UserInfo(
      {required this.id,
      required this.uname,
      required this.password,
      required this.gender,
      required this.description,
      required this.cader,
      required this.cadername,
      required this.department,
      required this.createDt,
      required this.modifyDt,
      required this.active,
      required this.underscoreV,
      required this.loggTime,
      required this.userCader,
      required this.secure});
}

class UserCader {
  final String id;
  final String cdname;
  final bool active;
  final String code;

  const UserCader(
      {required this.id,
      required this.cdname,
      required this.active,
      required this.code
      });
}