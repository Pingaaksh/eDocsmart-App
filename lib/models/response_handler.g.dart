// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
part of 'response_handler.dart';

ResponseHandler _$ResponseHandlerFromJson(Map<String, dynamic> json) =>
    ResponseHandler(
      httpStatus: json['httpStatus'] as int? ?? 200,
      error: json['error'] as bool?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      result: json['result'],
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ResponseHandlerToJson(ResponseHandler instance) =>
    <String, dynamic>{
      'error': instance.error,
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
      'httpStatus': instance.httpStatus,
      'token': instance.token,
    };