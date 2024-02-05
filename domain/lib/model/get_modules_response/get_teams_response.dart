class GetTeamsResponse {
  final int sCode;
  final String sMessage;
  final GetTeamsResponseData? data;

  const GetTeamsResponse(
      {required this.sCode,
      required this.sMessage,
      this.data});
}

class GetTeamsResponseData {
  final String id;
  final String branch;
  final List<CaderList> caderList;

  const GetTeamsResponseData(
      {required this.id,
      required this.branch,
        required this.caderList});
}

class CaderList {
  final String id;
  final String cader;
  final List<UserData> userData;

  const CaderList(
      {required this.id,
      required this.cader,
      required this.userData});
}

class UserData {
  final String id;
  final bool isChecked;

  const UserData(
      {required this.id,
      required this.isChecked});
}