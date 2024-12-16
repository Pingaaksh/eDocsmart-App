// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:skin_match/core/common/logger.dart';
part 'response_handler.g.dart';

@JsonSerializable()
class ResponseHandler {
  bool? error;
  int? status;
  String? message;
  dynamic result;
  int httpStatus;
  String? token;

  static bool _isSuccess(int value) {
    Logger.write('--------========= $value');
    return value == 200;
  }


  bool get isSuccess =>
      (_isSuccess(status ?? 0) && _isSuccess(httpStatus)) && !(error ?? true);

  ResponseHandler({
    this.httpStatus = 200,
    this.error,
    this.status,
    this.message,
    this.result,
    this.token,
  });

  factory ResponseHandler.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return ResponseHandler.fromJsonHidden(json);
    } else {
      return ResponseHandler(
        status: 500,
        message: 'Unable to complete this request',
        error: true,
        httpStatus: 500,
      );
    }
  }

  factory ResponseHandler.fromJsonHidden(Map<String, dynamic> json) =>
      _$ResponseHandlerFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseHandlerToJson(this);
}