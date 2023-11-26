import 'package:domain/model/common_response/common_data.dart';

class CommonResponse {
  final int sCode;
  final String sMessage;
  final List<dynamic> data;

  CommonResponse(
    {required this.sCode,
      required this.sMessage,
      required this.data});
}
