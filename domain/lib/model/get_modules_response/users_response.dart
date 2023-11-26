class UsersListResponse {
  final int sCode;
  final String sMessage;
  final List<UsersListResponseData> data;

  const UsersListResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class UsersListResponseData {
  final String id;
  final String uname;
  final String cadername;
  final String gender;
  final bool active;
  final String gendername;
  final String cader;
  final String password;
  final String desc;

  const UsersListResponseData(
      {
        required this.id,
        required this.uname,
        required this.cadername,
        required this.gender,
        required this.gendername,
        required this.active,
        required this.cader,
        required this.password,
        required this.desc
        });
}