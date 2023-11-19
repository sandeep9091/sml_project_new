class ErrorInfo {
final String message;
final int? code;
final String? apiErrorCode;
final String? apiErrorStatus;
final String description;

ErrorInfo({
required this.message,
this.code,
this.apiErrorCode="-1",
this.apiErrorStatus="",
this.description="",
});
}                                                                                                                                                                    