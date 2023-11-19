import 'package:domain/model/common_response/common_data.dart';

class CommonResponse {
  final String? code;
  final String? message;
  final String? statusCode;
  final String? channel;
  final bool? status;
  final CommonData? data;

  CommonResponse({
    this.code,
    this.message,
    this.statusCode,
    this.channel,
    this.status,
    this.data,
  });
}
