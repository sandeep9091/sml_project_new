class GetModulesNewResponse {
  final int sCode;
  final String sMessage;
  final List<GetModulesNewResponseData> data;

  const GetModulesNewResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class GetModulesNewResponseData {
  final String id;
  final String cader;
  final String code;
  final List<Modules> modules;

  const GetModulesNewResponseData(
      {
        required this.id,
        required this.cader,
        required this.code,
        required this.modules});
}

class Modules {
  final String name;
  final String isCanDo;
  final String path;

  const Modules(
      {required this.name,
      required this.isCanDo,
      required this.path});
}