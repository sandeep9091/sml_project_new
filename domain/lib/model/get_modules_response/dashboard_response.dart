class GetDashboardResponse {
  final int sCode;
  final String sMessage;
  final List<GetDashboardResponseData> data;

  const GetDashboardResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class GetDashboardResponseData {
  final String header;
  final int cnt;
  final int newCnt;
  final int last7Cnt;
  final int activeCnt;
  final int inActiveCnt;

  const GetDashboardResponseData(
      {
        required this.header,
        required this.cnt,
        required this.newCnt,
        required this.last7Cnt,
        required this.activeCnt,
        required this.inActiveCnt});
}