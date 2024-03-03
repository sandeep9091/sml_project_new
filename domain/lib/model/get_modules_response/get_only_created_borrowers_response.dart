
class GetOnlyCreatedBorrowersResponse {
  final int sCode;
  final String sMessage;
  final List<GetOnlyCreatedBorrowersResponseData> data;

  const GetOnlyCreatedBorrowersResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class GetOnlyCreatedBorrowersResponseData {
  final String id;
  final String name;

  const GetOnlyCreatedBorrowersResponseData(
      {required this.id,
      required this.name});
}