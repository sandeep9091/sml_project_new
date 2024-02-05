// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'get_team_mapper_response.g.dart';
// part 'get_team_mapper_response.freezed.dart';

class GetTeamMapperResponse {
  final int sCode;
  final String sMessage;
  final GetTeamMapperResponseData? data;

  const GetTeamMapperResponse(
      {required this.sCode,
      required this.sMessage,
      this.data});
}

class GetTeamMapperResponseData {
  final List<CaderData> caderData;

  const GetTeamMapperResponseData(
      {required this.caderData});
}

class CaderData {
  final String id;
  final String cdname;
  final bool active;
  final String code;
  final List<UsersData> usersData;

  const CaderData(
      {required this.id,
      required this.cdname,
      required this.active,
      required this.code,
      required this.usersData});
}

class UsersData {
  final String id;
  final String uname;
  bool isCheckBoxActive = false;

  UsersData(
      {required this.id,
      required this.uname,
      required this.isCheckBoxActive});
}

//////////////////////////



// @freezed
// class GetTeamMapperResponse with _$GetTeamMapperResponse {
//   factory GetTeamMapperResponse({
//     required int sCode,
//     required String sMessage,
//     GetTeamMapperResponseData? data,
//   }) = _GetTeamMapperResponse;

//   factory GetTeamMapperResponse.fromJson(Map<String, Object?> json) =>
//       _$GetTeamMapperResponseFromJson(json);
// }

// @freezed
// class GetTeamMapperResponseData with _$GetTeamMapperResponseData {
//   factory GetTeamMapperResponseData({
//     required List<CaderData> caderData,
//   }) = _GetTeamMapperResponseData;

//   factory GetTeamMapperResponseData.fromJson(Map<String, Object?> json) =>
//       _$GetTeamMapperResponseDataFromJson(json);
// }

// @freezed
// class CaderData with _$CaderData {
//   factory CaderData({
//     required String id,
//     required String cdname,
//     required String code,
//     required bool active,
//     required List<UsersData> usersData,
//   }) = _CaderData;

//   factory CaderData.fromJson(Map<String, Object?> json) =>
//       _$CaderDataFromJson(json);
// }

// @freezed
// class UsersData with _$UsersData {
//   factory UsersData({
//     required String id,
//     required String uname,
//     required bool isCheckBoxActive,
//   }) = _UsersData;

//   factory UsersData.fromJson(Map<String, Object?> json) =>
//       _$UsersDataFromJson(json);
// }